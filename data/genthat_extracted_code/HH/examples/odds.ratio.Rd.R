library(HH)


### Name: OddsRatio
### Title: Calculate or plot the odds ratio for a 2x2 table of counts.
### Aliases: OddsRatio plotOddsRatio plotOddsRatio.base
### Keywords: hplot htest

### ** Examples

data(glasses)

## draw the iso-odds ratio plot with 50% CI and 95% CI,
plotOddsRatio(glasses)

## return the 95% CI information
OddsRatio(glasses)

## draw the iso-odds ratio plot with 50% CI and 95% CI,
## invisibly return the 95% CI information
plotOddsRatio.base(glasses)



