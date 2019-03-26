library(nlstools)


### Name: nlstools
### Title: Nonlinear least squares fit
### Aliases: nlstools preview plotfit overview
### Keywords: nonlinear

### ** Examples

formulaExp <- as.formula(VO2 ~ (t <= 5.883) * VO2rest + (t > 5.883) * 
                        (VO2rest + (VO2peak - VO2rest) * 
                        (1 - exp(-(t - 5.883) / mu))))
preview(formulaExp, O2K, list(VO2rest = 400, VO2peak = 1600, mu = 1))
O2K.nls1 <- nls(formulaExp, start = list(VO2rest = 400, VO2peak = 1600, 
                mu = 1), data = O2K)
overview(O2K.nls1)
plotfit(O2K.nls1, smooth = TRUE)



