library(nlme)


### Name: intervals.gls
### Title: Confidence Intervals on gls Parameters
### Aliases: intervals.gls print.intervals.gls
### Keywords: models

### ** Examples

fm1 <- gls(follicles ~ sin(2*pi*Time) + cos(2*pi*Time), Ovary,
           correlation = corAR1(form = ~ 1 | Mare))
intervals(fm1)



