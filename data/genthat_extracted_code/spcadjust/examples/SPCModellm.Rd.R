library(spcadjust)


### Name: SPCModellm
### Title: Data model based on a linear model
### Aliases: SPCModellm

### ** Examples

n <- 1000
Xlinreg <- data.frame(x1= rbinom(n,1,0.4), x2= runif(n,0,1), x3= rnorm(n))
Xlinreg$y <- 2 + Xlinreg$x1 + Xlinreg$x2 + Xlinreg$x3 + rnorm(n)
## Not run: 
##D chartlinregCUSUM <- new("SPCCUSUM", model=SPCModellm(Delta=1,formula="y~x1+x2+x3"))
##D SPCproperty(data=Xlinreg,nrep=10,property="calARL",
##D             chart=chartlinregCUSUM,params=list(target=100))
##D #increase nrep in real applications.
##D #' chartlinregCUSUM2 <- new("SPCCUSUM",model=SPCModellm(Delta=1,formula="y~x1"))
##D SPCproperty(data=Xlinreg,nrep=10,property="calARL",
##D             chart=chartlinregCUSUM2,params=list(target=100))
##D #increase nrep in real applications.
##D 
##D chartlinregEWMA <- new("SPCEWMA", model=SPCModellm(Delta=0,formula="y~x1+x2+x3"),lambda=0.8)
##D SPCproperty(data=Xlinreg,nrep=10,property="calARL",
##D             chart=chartlinregEWMA,params=list(target=100))
##D #increase nrep in real applications.
##D 
##D chartlinregEWMA2 <- new("SPCEWMA",model=SPCModellm(Delta=0,formula="y~x1"),lambda=0.8)
##D SPCproperty(data=Xlinreg,nrep=10,property="calARL",
##D             chart=chartlinregEWMA2,params=list(target=100))
## End(Not run)
#increase nrep in real applications.



