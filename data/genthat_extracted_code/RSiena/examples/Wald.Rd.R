library(RSiena)


### Name: Wald
### Title: Wald and score tests for RSiena results
### Aliases: Wald.RSiena Multipar.RSiena score.Test scoreTest
### Keywords: tests

### ** Examples

mynet <- sienaDependent(array(c(s501, s502), dim=c(50, 50, 2)))
mydata <- sienaDataCreate(mynet)
myeff <- getEffects(mydata)
myalgorithm <- sienaAlgorithmCreate(nsub=1, n3=40, seed=123)
# nsub=1 and n3=40 is used here for having a brief computation,
# not for practice.
myeff <- includeEffects(myeff, transTrip, transTies)
myeff <- includeEffects(myeff, outAct, outPop, fix=TRUE, test=TRUE)
(ans <- siena07(myalgorithm, data=mydata, effects=myeff, batch=TRUE))
A <- matrix(0, 2, 6)
A[1, 3] <- 1
A[2, 4] <- 1
Wald.RSiena(A, ans)
# A shortcut for the above is:
Multipar.RSiena(ans, 3, 4)
# The following two are equivalent:
score.Test(ans, c(FALSE, FALSE, FALSE, FALSE, FALSE, TRUE))
score.Test(ans,6)
# Getting all 1-df score tests separately:
# (More identifying information for the effects may be added as necessary)
for (i in which(ans$test)){
   sct <- score.Test(ans,i)
   cat(ans$requestedEffects$effectName[i], '\n',
   '    chisquared =', round(sct$chisquare,1),
   '; p =', round(sct$pvalue,3), '\n')}



