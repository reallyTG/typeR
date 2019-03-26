library(diveMove)


### Name: bouts2MLE
### Title: Maximum Likelihood Model of mixture of 2 Poisson Processes
### Aliases: bouts2.mleFUN bouts2.ll bouts2.LL bouts.mle bouts2.mleBEC
###   plotBouts2.mle plotBouts2.cdf
### Keywords: models manip

### ** Examples


## No test: 
## Too long for checks
## Using the Example from '?diveStats':
utils::example("diveStats", package="diveMove",
               ask=FALSE, echo=FALSE)
postdives <- tdrX.tab$postdive.dur[tdrX.tab$phase.no == 2]
postdives.diff <- abs(diff(postdives))

## Remove isolated dives
postdives.diff <- postdives.diff[postdives.diff < 2000]
lnfreq <- boutfreqs(postdives.diff, bw=0.1, plot=FALSE)
startval <- boutinit(lnfreq, 50)
p <- startval[[1]]["a"] / (startval[[1]]["a"] + startval[[2]]["a"])

## Fit the reparameterized (transformed parameters) model
## Drop names by wrapping around as.vector()
init.parms <- list(p=as.vector(logit(p)),
                   lambda1=as.vector(log(startval[[1]]["lambda"])),
                   lambda2=as.vector(log(startval[[2]]["lambda"])))
bout.fit1 <- bouts.mle(bouts2.LL, start=init.parms, x=postdives.diff,
                       method="L-BFGS-B", lower=c(-2, -5, -10))
coefs <- as.vector(coef(bout.fit1))

## Un-transform and fit the original parameterization
init.parms <- list(p=unLogit(coefs[1]), lambda1=exp(coefs[2]),
                   lambda2=exp(coefs[3]))
bout.fit2 <- bouts.mle(bouts2.ll, x=postdives.diff, start=init.parms,
                       method="L-BFGS-B", lower=rep(1e-08, 3),
                       control=list(parscale=c(1, 0.1, 0.01)))
plotBouts(bout.fit2, postdives.diff)

## Plot cumulative frequency distribution
plotBouts2.cdf(bout.fit2, postdives.diff)

## Estimated BEC
bec <- bec2(bout.fit2)

## Label bouts
labelBouts(postdives, rep(bec, length(postdives)),
           bec.method="seq.diff")

## End(No test)




