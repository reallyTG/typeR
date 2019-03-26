library(ProfessR)


### Name: ProfessR-package
### Title: Grades Setting and Exam Maker
### Aliases: ProfessR-package ProfessR
### Keywords: package

### ** Examples


################  making tests:

data(QBANK1)
make.exam(QBANK1, ofile="exam1.tex")



#################  setting grades:
g = rnorm(n=130, m=82, sd=10)
g[g>100] = 100
g[g<1] = 1

B = boxplot(g)

divs = c(min(g), B$stats[1:4] + diff(B$stats)/2, max(g) )

D1 = do.grades(g, divs=divs, tit="GEOL 105 Exam 1")







