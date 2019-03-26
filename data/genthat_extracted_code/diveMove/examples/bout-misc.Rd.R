library(diveMove)


### Name: bout-misc
### Title: Fit a Broken Stick Model on Log Frequency Data for
###   identification of bouts of behaviour
### Aliases: boutfreqs boutinit labelBouts logit unLogit
### Keywords: misc manip

### ** Examples


## No test: 
## Too long for checks
## Using the Example from '?diveStats':
utils::example("diveStats", package="diveMove",
               ask=FALSE, echo=FALSE)
postdives <- tdrX.tab$postdive.dur[tdrX.tab$phase.no == 2]
## Remove isolated dives
postdives <- postdives[postdives < 2000]
lnfreq <- boutfreqs(postdives, bw=0.1, method="seq.diff", plot=FALSE)
boutinit(lnfreq, 50)

## See ?bouts.mle for labelBouts() example

## End(No test)




