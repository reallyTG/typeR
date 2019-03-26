library(lpint)


### Name: lpint
### Title: Martingale estimating equation local polynomial estimator of
###   counting process intensity function and its derivatives
### Aliases: lpint
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
intest <- lpint(jtms,Tau=censor)
##plot and compare
plot(intest,xlab="time",ylab="intensity",type="l",lty=1)
curve(int,add=TRUE,lty=2)

## Example estimating the hazard function from right censored data:
## First simulate the (not directly observable) life times and censoring
## times:
lt <- rweibull(500,2.5,3); ct <- rlnorm(500,1,0.5)
## Now the censored times and censorship indicators delta (the
## observables): 
ot <- pmin(lt,ct); dlt <- as.numeric(lt <= ct);
## Estimate the hazard rate based on the censored observations:
jtms <- sort(ot[dlt==1]);
Y <- sapply(jtms,function(x)sum(ot>=x));
haz.est <- lpint(jtms,Y=Y);
## plot the estimated hazard function:
matplot(haz.est$x,
        pmax(haz.est$y+outer(haz.est$se,c(-1,0,1)*qnorm(0.975)),0),
        type="l",lty=c(2,1,2),
        xlab="t",ylab="h(t)",
        col=1);
## add the truth:
haz <- function(x)dweibull(x,2.5,3)/pweibull(x,2.5,3,lower.tail=FALSE)
curve(haz, add=TRUE,col=2)



