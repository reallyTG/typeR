library(diveMove)


### Name: bouts3NLS
### Title: Fit mixture of 3 Poisson Processes to Log Frequency data
### Aliases: bouts3.nlsFUN bouts3.nls bouts3.nlsBEC plotBouts3.nls
### Keywords: models manip

### ** Examples


## No test: 
## Too long for checks
## Using the Example from '?diveStats':
utils::example("diveStats", package="diveMove",
               ask=FALSE, echo=FALSE)
## Postdive durations
postdives <- tdrX.tab$postdive.dur
postdives.diff <- abs(diff(postdives))
## Remove isolated dives
postdives.diff <- postdives.diff[postdives.diff < 4000]

## Construct histogram
lnfreq <- boutfreqs(postdives.diff, bw=0.1, plot=FALSE)

startval <- boutinit(lnfreq, c(50, 400))
## Drop names by wrapping around as.vector()
startval.l <- list(a1=as.vector(startval[[1]]["a"]),
                   lambda1=as.vector(startval[[1]]["lambda"]),
                   a2=as.vector(startval[[2]]["a"]),
                   lambda2=as.vector(startval[[2]]["lambda"]),
                   a3=as.vector(startval[[3]]["a"]),
                   lambda3=as.vector(startval[[3]]["lambda"]))

## Fit the 3 process model
bout.fit <- bouts3.nls(lnfreq, start=startval.l, maxiter=500)
summary(bout.fit)
plotBouts(bout.fit)

## Estimated BEC
bec3(bout.fit)

## End(No test)




