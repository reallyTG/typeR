library(ProfessR)


### Name: jist
### Title: Add letter grades to histogram
### Aliases: jist
### Keywords: aplot

### ** Examples



g = rnorm(130, m=82, sd=10)
g[g>100] = 100
g[g<1] = 1

B = boxplot(g)


divs = c(min(g), B$stats[1:4] + diff(B$stats)/2, max(g) )

####G1  = do.grades(g, cut=20, tit="GEOL 105 Exam 1")

##########  replot with existing divisions:
D1 = do.grades(g, divs=divs, tit="GEOL 105 Exam 1")

jist(D1$hist, D1$grades, D1$lett)

##########  or simply:

D1 = do.grades(g, divs=divs, tit="GEOL 105 Exam 1")

jist(D1)






