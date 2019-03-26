library(mra)


### Name: F.cjs.estim
### Title: F.cjs.estim - Cormack-Jolly-Seber estimation
### Aliases: F.cjs.estim cr.estim CJS cjs Cormack Jolly Seber
### Keywords: survival models

### ** Examples




## Fit CJS model to dipper data, time-varying capture and survivals.
## Method 1 : using factors
data(dipper.histories)
ct <- as.factor( paste("T",1:ncol(dipper.histories), sep=""))
attr(ct,"nan")<-nrow(dipper.histories)
dipper.cjs <- F.cjs.estim( ~tvar(ct,drop=c(1,2)), ~tvar(ct,drop=c(1,6,7)), dipper.histories )

## Method 2 : same thing using 2-d matrices
xy <- F.cjs.covars( nrow(dipper.histories), ncol(dipper.histories) )
# The following extracts 2-D matrices of 0s and 1s
for(j in 1:ncol(dipper.histories)){ assign(paste("x",j,sep=""), xy$x[,,j]) } 
dipper.cjs <- F.cjs.estim( ~x3+x4+x5+x6+x7, ~x2+x3+x4+x5, dipper.histories )

## Values in the 1st column of capture covariates do not matter
x3.a <- x3
x3.a[,1] <- 999
dipper.cjs2 <- F.cjs.estim( ~x3.a+x4+x5+x6+x7, ~x2+x3+x4+x5, dipper.histories )
# compare dipper.cjs2 to dipper.cjs

## Values in the last column of survival covariates do not matter
x3.a <- x3
x3.a[,ncol(dipper.histories)] <- 999
dipper.cjs2 <- F.cjs.estim( ~x3+x4+x5+x6+x7, ~x2+x3.a+x4+x5, dipper.histories )
# compare dipper.cjs2 to dipper.cjs


## A plot to compare the link functions
sine.link <- function(eta){ ifelse( eta < -4, 0, ifelse( eta > 4, 1, .5*(1+sin(eta*pi/8)))) }
eta <- seq(-5,5, length=40)
p1 <- 1 / (1 + exp(-eta))
p2 <- sine.link(eta)
p3 <- 1.0 - exp( -exp( eta ))
plot(eta, p1, type="l" )
lines(eta, p2, col="red" )
lines(eta, p3, col="blue" )
legend( "topleft", legend=c("logit", "sine", "hazard"), col=c("black", "red", "blue"), lty=1)







