library(rbounds)


### Name: iv_sens
### Title: Function to calculate Rosenbaum bounds for IV Estimator based on
###   Wilcoxon sign rank test.
### Aliases: iv_sens

### ** Examples

## Example from Rosenbaum (2010, ch. 5).

data(AngristLavy)

#Match on Economic Status Across Levels of the Instrument
rr <- Match(Y=AngristLavy$avgmath, Tr=AngristLavy$z, X=AngristLavy$pct_disadv, 
estimand ="ATC", M=2,  replace=FALSE)

#Extract Matched Outome Data
ctrl <- AngristLavy$avgmath[rr$index.control]
trt <- AngristLavy$avgmath[rr$index.treated]

#Extract Matched Doses
#Doses Encouraged By Instrument - Here Class Size
csize.trt <- AngristLavy$classize[rr$index.treated]
csize.ctrl <- AngristLavy$classize[rr$index.control]

#Run Sensitivity Analsyis
iv_sens(trt, ctrl, csize.trt, csize.ctrl, Gamma=2, GammaInc=.1)




