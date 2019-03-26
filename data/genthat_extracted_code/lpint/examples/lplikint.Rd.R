library(lpint)


### Name: lplikint
### Title: Partial likelihood based local polynomial estimators of the
###   counting process intensity function and its derivatives
### Aliases: lplikint
### Keywords: smooth survival

### ** Examples

##simulate a Poisson process on [0,1] with given intensity
int <- function(x)100*(1+0.5*cos(2*pi*x))
censor <- 1
set.seed(2)
N <- rpois(1,150*censor);
jtms <- runif(N,0,censor);
jtms <- jtms[as.logical(mapply(rbinom,n=1,size=1,prob=int(jtms)/150))];

##estimate the intensity
intest <- lplikint(jtms,bw=0.15,Tau=censor)
#plot and compare
plot(intest,xlab="time",ylab="intensity",type="l",lty=1)
curve(int,add=TRUE,lty=2)



