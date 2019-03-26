library(pastecs)


### Name: match.tol
### Title: Determine matching observation with a tolerance in time-scale
### Aliases: match.tol
### Keywords: ts manip

### ** Examples

X <- 1:5
Table <- c(1, 3.1, 3.8, 4.4, 5.1, 6)
match.tol(X, Table)
match.tol(X, Table, tol=0.2)
match.tol(X, Table, tol=0.55)



