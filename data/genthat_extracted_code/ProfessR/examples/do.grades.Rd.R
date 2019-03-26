library(ProfessR)


### Name: do.grades
### Title: Do Grades
### Aliases: do.grades
### Keywords: misc hplot iplot

### ** Examples



g = rnorm(n=130, m=82, sd=10)
g[g>100] = 100
g[g<1] = 1

B = boxplot(g)

##########   set divisions automatically:

divs = c(min(g), B$stats[1:4] + diff(B$stats)/2, max(g) )



###  to run interactively, remove the divs
###  D1 = do.grades(g, tit="GEOL 105 Exam 1")

### otherwise use previously calculated divs:
D1 = do.grades(g, divs=divs, tit="GEOL 105 Exam 1")

## Not run: 
##D 
##D ####  this is interactive
##D D1 = do.grades(g, tit="GEOL 105 Exam 1")
##D 
##D #######  list the grades:
##D cbind(D1$grades,  D1$lett,  D1$scor)
##D 
##D ####### if you have names or ID's try:
##D #######  cbind(IDs, D1$grades,  D1$lett,  D1$scor)
##D 
##D \dontrun{
##D 
##D  DUMPgrades(D1, file="TEST1grades", id=IDS )
##D }
##D 
## End(Not run)








