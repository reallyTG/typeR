library(ProfessR)


### Name: DUMPgrades
### Title: Dump grades to a file
### Aliases: DUMPgrades
### Keywords: misc

### ** Examples


g = rnorm(n=130, m=82, sd=10)
g[g>100] = 100
g[g<1] = 1

B = boxplot(g)

divs = c(min(g), B$stats[1:4] + diff(B$stats)/2, max(g) )



###  to run interactively, remove the divs
###  D1 = do.grades(g, tit="GEOL 105 Exam 1")

### otherwise use previously calculated divs:
D1 = do.grades(g, divs=divs, tit="GEOL 105 Exam 1")

## Not run: 
##D 
##D DUMPgrades(D1, file="TEST1grades" )
##D 
## End(Not run)




