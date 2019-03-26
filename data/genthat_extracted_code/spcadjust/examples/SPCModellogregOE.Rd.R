library(spcadjust)


### Name: SPCModellogregOE
### Title: Data Model for Binary Responses using a Logarithmic Model and
###   observed minus expected updates.
### Aliases: SPCModellogregOE

### ** Examples

n <- 1000
Xlogreg <- data.frame(x1=rbinom(n,1,0.4), x2=runif(n,0,1), x3=rnorm(n))
xbeta <- -1+Xlogreg$x1*100+Xlogreg$x2+Xlogreg$x3
Xlogreg$y <- rbinom(n,1,exp(xbeta)/(1+exp(xbeta)))
chartlogreg <- new("SPCEWMA",
                   model=SPCModellogregOE(Delta= 0, formula="y~x1+x2+x3"), lambda=0.8)
SPCproperty(data=Xlogreg,nrep=10,property="calARL",
            chart=chartlogreg,params=list(target=100))
#increase nrep for real applications.



