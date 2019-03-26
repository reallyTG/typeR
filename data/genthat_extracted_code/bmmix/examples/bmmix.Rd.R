library(bmmix)


### Name: Bayesian multinomial mixture model
### Title: Bayesian multinomial mixture model estimation using MCMC
### Aliases: bmmix

### ** Examples

## GENERATE TOY DATA ##
## ST frequencies in 3 origins:
## dogs, cows, asymptotic cases in human
f.dogs <- c(.5, .3, .1, .1, 0)
f.cows <- c(.6, .1, .1, .1, .1)
f.asymp <- c(0, .1, .2, 0, .7)

## mixture (y would be symptomatic cases)
f.y <- .1*f.dogs + .1*f.cows + .8*f.asymp

set.seed(1)
dogs <- rmultinom(1, 30, f.dogs)
cows <- rmultinom(1, 50, f.cows)
asymp <- rmultinom(1, 35, f.asymp)
X <- data.frame(dogs, cows, asymp,
   row.names=paste("ST", letters[1:5]))
X
y <- rmultinom(1, 40, f.y)
y

cbind(X,y)


## RUN BMMIX ##

## BASIC MODEL
## note: small n for this example only!
set.seed(1)
res <- bmmix(X,y, n=3e4)
head(res)


## VISUALIZE RESULTS ##
if(require("ggplot2") && require("reshape2")){

## manually ##
## chech log-posterior
ggplot(dat=res) + geom_line(aes(x=step, y=post)) +
   labs(title="Trace of log-posterior values")

## check mixture coefficients
fig.dat <- melt(res, id=1:4)

ggplot(dat=fig.dat, aes(x=step)) +
   geom_line(aes(y=value, colour=variable)) +
   labs(title="Trace of mixture coefficients")


## with process.bmmix ##
## mixture coefficients
temp <- process.bmmix(res, "alpha")
names(temp)
temp$alpha # values 
temp$trace # graphics: trace
temp$hist # graphics: histograms
temp$dens # graphics: densities
temp$violin # graphics: violinplot

}


## Not run: 
##D ## MODEL WITH ESTIMATED FREQUENCIES
##D set.seed(1)
##D res <- bmmix(X,y, move.phi=TRUE)
##D head(res)
##D 
##D ## VISUALIZE RESULTS
##D if(require("ggplot2") && require("reshape2")){
##D 
##D ## chech log-posterior
##D ggplot(dat=res) + geom_line(aes(x=step, y=post)) +
##D    labs(title="Trace of log-posterior values")
##D 
##D fig.dat <- melt(res[,1:7], id=1:4)
##D 
##D ## check mixture coefficients
##D ggplot(dat=fig.dat, aes(x=step)) +
##D    geom_line(aes(y=value, colour=variable)) +
##D    labs(title="Trace of mixture coefficients")
##D 
##D ## check ST frequencies, i.e. in dogs:
##D fig.dat <- melt(res[,c(1,grep("dogs", names(res))[-1])], id=1)
##D 
##D ggplot(dat=fig.dat) +
##D    geom_line(aes(x=step, y=value, colour=variable)) +
##D    labs(title="Estimate of ST frequencies in dogs")
##D 
##D ggplot(dat=fig.dat) +
##D    geom_density(aes(x=value, fill=variable),alpha=.2) +
##D    labs(title="Estimate of ST frequencies in dogs")
##D }
## End(Not run)




