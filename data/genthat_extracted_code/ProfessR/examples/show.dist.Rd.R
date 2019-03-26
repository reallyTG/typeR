library(ProfessR)


### Name: show.dist
### Title: Show Distribution of Grades
### Aliases: show.dist
### Keywords: misc

### ** Examples

g = rnorm(n=130, m=82, sd=10)
g[g>100] = 100
g[g<1] = 1

B = boxplot(g)

divs = c(min(g), B$stats[1:4] + diff(B$stats)/2, max(g) )
D1 = do.grades(g, divs=divs, tit="GEOL 105 Exam 1")

show.dist(D1)




