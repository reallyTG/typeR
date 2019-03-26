library(diveMove)


### Name: bouts2NLS
### Title: Fit mixture of 2 Poisson Processes to Log Frequency data
### Aliases: bouts2.nlsFUN bouts2.nls bouts2.nlsBEC plotBouts2.nls
### Keywords: models manip

### ** Examples


## No test: 
## Too long for checks
## Using the Example from '?diveStats':
utils::example("diveStats", package="diveMove",
               ask=FALSE, echo=FALSE)
## Postdive durations
postdives <- tdrX.tab$postdive.dur[tdrX.tab$phase.no == 2]
postdives.diff <- abs(diff(postdives))
## Remove isolated dives
postdives.diff <- postdives.diff[postdives.diff < 2000]

## Construct histogram
lnfreq <- boutfreqs(postdives.diff, bw=0.1, plot=FALSE)

startval <- boutinit(lnfreq, 50)
## Drop names by wrapping around as.vector()
startval.l <- list(a1=as.vector(startval[[1]]["a"]),
                   lambda1=as.vector(startval[[1]]["lambda"]),
                   a2=as.vector(startval[[2]]["a"]),
                   lambda2=as.vector(startval[[2]]["lambda"]))

## Fit the 2 process model
bout.fit <- bouts2.nls(lnfreq, start=startval.l, maxiter=500)
summary(bout.fit)
plotBouts(bout.fit)

## Estimated BEC
bec2(bout.fit)

## End(No test)




