library(FSA)


### Name: compIntercepts
### Title: Tests for significant differences among all pairs of intercepts
###   in a dummy variable regression.
### Aliases: compIntercepts print.compIntercepts
### Keywords: htest

### ** Examples

## Reduce Mirex data to years where slopes don't differ to illustrate this
##   function ... see compSlopes() for analysis of full data set. 
Mirex <- Mirex[Mirex$year!="1996" & Mirex$year!="1999",]
Mirex$year <- factor(Mirex$year)
## Fit DVR, see that slopes don't differ, 
##   compare intercepts, visualize results
lm1 <- lm(mirex~weight*year,data=Mirex)
anova(lm1)
compIntercepts(lm1)
## Fit model without interaction to avoid warning, but
##   note that the compIntercepts() results are the same
lm2 <- lm(mirex~weight+year,data=Mirex)
compIntercepts(lm2)
fitPlot(lm1,legend="topleft")




