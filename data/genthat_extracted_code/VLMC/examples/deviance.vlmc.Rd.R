library(VLMC)


### Name: deviance.vlmc
### Title: Compute the Deviance of a Fitted VLMC Object
### Aliases: deviance.vlmc
### Keywords: ts models

### ** Examples

example(vlmc)
deviance(vlmc.pres)

devianceR <- function(object)
{
    dn <- dimnames(pr <- predict(object))
    -2 * sum(log(pr[cbind(2:nrow(pr), match(dn[[1]][-1], dn[[2]]))]))
}
all.equal(deviance(vlmc.pres), devianceR(vlmc.pres), tol = 1e-14)



