library(nlstools)


### Name: nlsContourRSS
### Title: Surface contour of RSS
### Aliases: nlsContourRSS plot.nlsContourRSS print.nlsContourRSS
### Keywords: nonlinear

### ** Examples

formulaExp <- as.formula(VO2 ~ (t <= 5.883) * VO2rest + (t > 5.883) * 
                        (VO2rest + (VO2peak - VO2rest) * 
                        (1 - exp(-(t - 5.883) / mu))))
O2K.nls1 <- nls(formulaExp, start = list(VO2rest = 400, VO2peak = 1600, 
                mu = 1), data = O2K)
O2K.cont1 <- nlsContourRSS(O2K.nls1)
plot(O2K.cont1)



