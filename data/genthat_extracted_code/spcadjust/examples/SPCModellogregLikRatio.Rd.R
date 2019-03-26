library(spcadjust)


### Name: SPCModellogregLikRatio
### Title: Data Model for Binary Responses using a logarithmic model and
###   likelihood ratio updates.
### Aliases: SPCModellogregLikRatio

### ** Examples

n <- 1000
Xlogreg <- data.frame(x1=rbinom(n,1,0.4), x2=runif(n,0,1), x3=rnorm(n))
xbeta <- -1+Xlogreg$x1*100+Xlogreg$x2+Xlogreg$x3
Xlogreg$y <- rbinom(n,1,exp(xbeta)/(1+exp(xbeta)))
chartlogreg <- new("SPCCUSUM",
                   model=SPCModellogregLikRatio(Delta= 1, formula="y~x1+x2+x3"))
SPCproperty(data=Xlogreg,nrep=10,property="calARL",
            chart=chartlogreg,params=list(target=100))
#increase nrep for real applications.



