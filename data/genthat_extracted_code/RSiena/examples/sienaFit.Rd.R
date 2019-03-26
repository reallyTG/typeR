library(RSiena)


### Name: sienaFit.methods
### Title: Methods for processing sienaFit objects, produced by 'siena07'.
### Aliases: sienaFit.methods print.summary.sienaFit sienaFit
###   xtable.sienaFit print.xtable.sienaFit siena.table print.sienaFit
###   summary.sienaFit
### Keywords: methods

### ** Examples

myalgorithm <- sienaAlgorithmCreate(nsub=2, n3=100)
mynet1 <- sienaDependent(array(c(tmp3, tmp4), dim=c(32, 32, 2)))
mydata <- sienaDataCreate(mynet1)
myeff <- getEffects(mydata)
ans <- siena07(myalgorithm, data=mydata, effects=myeff, batch=TRUE)
ans
summary(ans)
## Not run: 
##D xtable(ans, type="html", file="ans.html")
##D siena.table(ans, type="html", tstat=TRUE, d=2)
## End(Not run)



