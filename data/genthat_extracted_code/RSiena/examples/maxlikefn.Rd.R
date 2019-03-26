library(RSiena)


### Name: maxlikefn
### Title: A ML version of FRAN
### Aliases: maxlikefn

### ** Examples

## Not run: 
##D mynet1 <- sienaDependent(array(c(tmp3, tmp4), dim=c(32, 32, 2)))
##D mydata <- sienaDataCreate(mynet1)
##D myeff<- getEffects(mydata)
##D myalgor<- sienaAlgorithmCreate(nsub=2, n3=100, maxlike=TRUE)
##D ans<- siena07(myalgor, data=mydata, effects=myeff,  batch=TRUE)
## End(Not run)


