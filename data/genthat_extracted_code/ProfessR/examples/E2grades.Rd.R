library(ProfessR)


### Name: E2grades
### Title: Examination grades from Test 2 in 2007
### Aliases: E2grades
### Keywords: datasets

### ** Examples

data(E2grades)

g = E2grades

B = boxplot(g[g>1], plot=FALSE)
divs = c(min(g), B$stats[1:4] + diff(B$stats)/2, max(g) )
###  get(getOption("device"))(width = 12, height = 7)

D1 = do.grades(g, divs=divs, cut = 15, tit="GEOL 105 Exam 1")

jist(D1$hist, D1$grades, D1$lett, col='purple')




