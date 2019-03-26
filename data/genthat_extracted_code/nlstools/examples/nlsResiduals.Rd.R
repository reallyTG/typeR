library(nlstools)


### Name: nlsResiduals
### Title: NLS residuals
### Aliases: nlsResiduals plot.nlsResiduals test.nlsResiduals
###   print.nlsResiduals
### Keywords: nonlinear

### ** Examples

# Plots of residuals
formulaExp <- as.formula(VO2 ~ (t <= 5.883) * VO2rest + (t > 5.883) * 
                        (VO2rest + (VO2peak - VO2rest) * 
                        (1 - exp(-(t - 5.883) / mu))))
O2K.nls1 <- nls(formulaExp, start = list(VO2rest = 400, VO2peak = 1600, mu = 1), 
               data = O2K)
O2K.res1 <- nlsResiduals(O2K.nls1)
plot(O2K.res1, which = 0)

# Histogram and qq-plot
plot(O2K.res1, which = 5)
plot(O2K.res1, which = 6)
	
# Tests
test.nlsResiduals(O2K.res1)



