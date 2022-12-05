; using initial-fact to call first rule to know if the user is a student or not
(defrule read-student
            (initial-fact)
            =>
            (printout t crlf "---------------------------------------------------"crlf)
            (printout t "      Welcome to House purchase Expert System" crlf)
            (printout t "---------------------------------------------------"crlf)
		    (printout t "[Note: This expert system is case sensitive.]"crlf crlf)
            (printout t"Are you a student [yes/no]?" crlf)
            (assert (student (read)))
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; STUDENT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



; if the user is a student then ask & get what is his/her monthly income
(defrule read-student-income
	(student yes)
	=>
	(printout t crlf "What is your monthly income?" crlf "1. Low      2. Medium       3. High" crlf)
	(assert (income (read)))
)



; if the student press 1 set student-salay-type low
(defrule student-income-low
	(student yes)
	(income ?inc)
	=>
	(if(= ?inc 1)
	then
	(assert(student-salary-type low)))
)



; if the student press 2 set student-salay-type medium
(defrule student-income-medium
	(student yes)
	(income ?inc)
	=>
	(if(= ?inc 2)
	then
	(assert(student-salary-type medium)))
)

    

; if the student press 3 set student-salay-type high
(defrule student-income-high
	(student yes)
	(income ?inc)
	=>
	(if(= ?inc 3)
	then
	(assert(student-salary-type high)))
)



; if student-salary-type is low then ask & get what is his/her credit-rating
(defrule read-student-credit
    (student yes)
    (student-salary-type low)
    =>
    (printout t crlf "Your credit rating? " crlf "1. Fair     2. Excellent" crlf)
    (assert(student-credit (read))))
)




; if the student press 1 then set student-credit-type fair
(defrule std-credit-fair
	(student yes)
	(student-credit ?crdt)
	=>
	(if(= ?crdt 1)
	then
	(assert(student-credit-type fair)))
)




; if the student press 2 then set student-credit-type excellent
(defrule std-credit-excellent
	(student yes)
	(student-credit ?crdt)
	=>
	(if(= ?crdt 2)
	then
	(assert(student-credit-type excellent)))
)




; if student-credit-type is Fair then set decision true
(defrule print-credit
    (student yes)
    (student-salary-type low)
    (student-credit-type fair)
    =>
    (assert(decision true)))




; if student-credit-type is fair then ask & get his/her age
(defrule read-student-age
    (student yes)
    (student-salary-type low)
    (student-credit-type excellent)
    =>
    (printout t crlf "Your Age?" crlf "1. 30-40     2. >40" crlf)
    (assert(student-age (read))))
)




; if user press 1 then set dicision true
(defrule print-student-age-young
    (student yes)
    (student-salary-type low)
    (student-credit-type excellent)
	(student-age ?age)
    =>
	(if(= 1 ?age)
	then 
	(assert(decision true)))
)




; if user press 2 then set dicision false
(defrule print-student-age-old
    (student yes)
    (student-salary-type low)
    (student-credit-type excellent)
	(student-age ?age)
    =>
	(if(= ?age 2)
	then 
	(assert(decision false)))
)



; if student-salary-type is medium or high then set decision true
(defrule print-income
    (student yes)
    (student-salary-type high | medium)
    =>
    (assert(decision true))
)






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; NOT STUDENT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;






; if the user is a not a student then ask & get what is his/her monthly income
(defrule read-employee-income
	(student no)
	=>
	(printout t crlf "What is your monthly earning?" crlf "1. High       2. Medium" crlf)
	(assert (income (read)))
)




; if the user press 1 then set employee-salay-type high
(defrule employee-income-high
	(student no)
	(income ?inc)
	=>
	(if(= ?inc 1)
	then
	(assert(employee-salary-type high)))
)





; if the user press 2 then set employee-salay-type medium
(defrule employee-income-medium
	(student no)
	(income ?inc)
	=>
	(if(= ?inc 2)
	then
	(assert(employee-salary-type medium)))
)





; if employee-salary-type is high then ask & get his/her age
(defrule read-high-employee-age
	(student no)
	(employee-salary-type high)
	=>
	(printout t crlf "Your Age?" crlf "1. <30     2. 30-40" crlf)
    (assert(high-employee-age (read))))
)





; if user press 1 then set dicision false
(defrule print-high-employee-age-young
    (student no)
    (employee-salary-type high)
    (high-employee-age ?eage)
    =>
	(if(= ?eage 1)
	then 
	(assert(decision false)))
)




; if the user press 2 then set dicision true
(defrule print-high-employee-age-old
    (student no)
    (employee-salary-type high)
    (high-employee-age ?eage)
    =>
	(if(= ?eage 2)
	then 
	(assert(decision true)))
)




; if employee-salary-type is medium then ask & get what is his/her credit-rating
(defrule read-employee-credit
	(student no)
	(employee-salary-type medium)
	=>
	(printout t crlf "Your credit?" crlf "1. Fair     2. Excellent" crlf)
	(assert(employee-credit (read))))
)





; if employee select 1 then set employee-credit-type fair
(defrule employee-credit-fair 
	(student no)
	(employee-salary-type medium)
	(employee-credit ?ecredit)
	=>
	(if(= ?ecredit 1)
	then
	(assert(employee-credit-type fair)))
)




; if employee select 2 then set employee-credit-type excellent
(defrule employee-credit-excellent 
	(student no)
	(employee-salary-type medium)
	(employee-credit ?ecredit)
	=>
	(if(= ?ecredit 2)
	then
	(assert(employee-credit-type excellent)))
)




; for fair employee-credit-type asking & getting users age
(defrule read-fair-credit-employee-age
	(student no)
	(employee-salary-type medium)
	(employee-credit-type fair)
	=>
	(printout t crlf "Your age?" crlf "1. >40     2. <30" crlf)
	(assert(fair-credit-employee-age (read))))
)





; making decision for employees age above 40
; if the user press press 1 than set decision true
(defrule employee-fair-age-old
	(student no)
	(employee-salary-type medium)
	(employee-credit-type fair)
	(fair-credit-employee-age ?efage)
	=>
	(if(= ?efage 1)
	then
	(assert(decision true)))
)



; making decision for employees age below 30
; if the user press press 2 than set decision false
(defrule employee-fair-age-young
	(student no)
	(employee-salary-type medium)
	(employee-credit-type fair)
	(fair-credit-employee-age ?efage)
	=>
	(if(= ?efage 2)
	then
	(assert(decision false)))
)





; for excellent employee-credit-type asking & getting users age
(defrule read-excellent-credit-employee-age
	(student no)
	(employee-salary-type medium)
	(employee-credit-type excellent)
	=>
	(printout t crlf "Your age?" crlf "1. 30-40     2. >40" crlf)
	(assert(excellent-credit-employee-age (read))))
)




; making decision for excellent employees ages between 30-40
; if the user press 1 then set decision ture
(defrule employee-excellent-age-young
	(student no)
	(employee-salary-type medium)
	(employee-credit-type excellent)
	(excellent-credit-employee-age ?eeage)
	=>
	(if(= ?eeage 1)
	then
	(assert(decision true)))
)



; making decision for excellent employees ages greater than 40
; if the user press 2 then set decision false
(defrule employee-excellent-age-old
	(student no)
	(employee-salary-type medium)
	(employee-credit-type excellent)
	(excellent-credit-employee-age ?eeage)
	=>
	(if(= ?eeage 2)
	then
	(assert(decision false)))
)








;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; PRINTING DECISION ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule print-positive
    (student ?)
	(decision true)
    =>
    (printout t crlf "Yes, You can buy a house." crlf crlf)
)



(defrule print-negative
    (student ?)
	(decision false)
    =>
    (printout t crlf "No, You should not buy a house!" crlf crlf)
)

