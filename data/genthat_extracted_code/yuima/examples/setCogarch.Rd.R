library(yuima)


### Name: setCogarch
### Title: Continuous-time GARCH (p,q) process
### Aliases: setCogarch Cogarch cogarch COGARCH CoGarch
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Ex 1. (Continuous time GARCH process driven by a compound poisson process)
prova<-setCogarch(p=1,q=3,work=FALSE,
                  measure=list(intensity="1", df=list("dnorm(z, 0, 1)")),
                  measure.type="CP",
                  Cogarch.var="y",
                  V.var="v",
                  Latent.var="x")




