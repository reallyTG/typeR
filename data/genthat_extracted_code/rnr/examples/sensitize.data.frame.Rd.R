library(rnr)


### Name: sensitize.data.frame
### Title: Compute the sensitivity-adjusted estimates of predicted outcome
###   given treatment/control
### Aliases: sensitize.data.frame

### ** Examples

obj <- data.frame(treat = 0, resp_ctl = .2, resp_trt = .3, p_trt = .5)
sensitize(obj, q = .5, dp = log(2), d0 = log(2), d1 = log(2))



