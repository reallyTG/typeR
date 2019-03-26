library(nlstools)


### Name: nlsBoot
### Title: Bootstrap resampling
### Aliases: nlsBoot plot.nlsBoot print.nlsBoot summary.nlsBoot
### Keywords: nonlinear

### ** Examples

formulaExp <- as.formula(VO2 ~ (t <= 5.883) * VO2res + (t > 5.883) * 
                        (VO2res + (VO2peak - VO2res) * 
                        (1 - exp(-(t - 5.883) / mu))))
O2K.nls1 <- nls(formulaExp, start = list(VO2res = 400, VO2peak = 1600, 
                mu = 1), data = O2K)
O2K.boot1 <- nlsBoot(O2K.nls1, niter = 200)
plot(O2K.boot1)
plot(O2K.boot1, type = "boxplot", ask = FALSE)
summary(O2K.boot1)
  


