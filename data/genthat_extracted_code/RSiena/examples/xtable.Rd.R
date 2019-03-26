library(RSiena)


### Name: xtable
### Title: Access xtable in package xtable
### Aliases: xtable
### Keywords: methods

### ** Examples


## The function is currently defined as
function (x, ...)
{
    xtable::xtable(x, ...)
  }
## Not run: 
##D myalgorithm <- sienaAlgorithmCreate(nsub=2, n3=100)
##D mynet1 <- sienaDependent(array(c(tmp3, tmp4), dim=c(32, 32, 2)))
##D mydata <- sienaDataCreate(mynet1)
##D myeff <- getEffects(mydata)
##D ans <- siena07(myalgorithm, data=mydata, effects=myeff, batch=TRUE)
##D ans
##D summary(ans)
##D xtable(ans, type="html", file="ans.html")
## End(Not run)



