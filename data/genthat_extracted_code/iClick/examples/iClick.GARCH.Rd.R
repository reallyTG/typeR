library(iClick)


### Name: iClick.GARCH
### Title: iClick Output GUI for Univariate GARCH Models
### Aliases: iClick.GARCH

### ** Examples


##==External data
data("world20")
y=na.omit(diff(log(world20[,1])))

##== Simulation data
#dat=rnorm(200,5,1)
#y=ts(dat, start = c(1970, 1), frequency = 12)

meanEQ=list(AR=1,MA=0,Exo=NULL, autoFitArma=FALSE,arfimaDiff=FALSE,archM=FALSE)
  # If there are external regressors X, put them as Exo=X
  # autoFitArma=TRUE, If you want to fit arma automatically.
  # arfimaDiff=TRUE,to take ARFIMA difference
  # archM=TRUE, to estimate GARCH-in-mean

garchEQ=list(Type="sGARCH",P=1,Q=1, exo=NULL)
  # Type: "sGARCH","eGARCH","gjrGARCH","iGARCH","apGARCH"
  # please check rugarch for details.
  # P is the ARCH order
  # Q is the GARCH order

#iClick.GARCH(y,meanEQ, garchEQ,  n.ahead=15)
# This computation takes more than 6 seconds, hence I added a # to block it.




