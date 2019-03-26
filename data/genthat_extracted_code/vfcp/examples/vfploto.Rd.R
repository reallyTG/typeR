library(vfcp)


### Name: vfploto
### Title: Plotting the cumulative distribution function or survival
###   function
### Aliases: vfploto
### Keywords: ~kwd1 ~kwd2

### ** Examples

require(copula)
tht = 0.475
cx = c(0.0025, 0.05, seq(0.1, 0.9, 0.1), 0.95, 0.975)
# nC = length(cx)
proh = c(0.9999999, 8, 4, 4, 4)
prod = c(0.999, 8, 4, 4, 4)
fam = "clayton"
marg = c("weibull", "lnorm")
xo = c(100, 1.5, 3, 0.425)
suro = vfploto(cx, proh, fam, marg, xo, tht, cdf=FALSE, plt=TRUE, rtn=FALSE)
cdfo = vfploto(cx, prod, fam, marg, xo, tht, cdf=TRUE, plt=TRUE, rtn=FALSE)
##
cx = 0.4
vfploto(cx, proh, fam, marg, xo, tht, cdf=TRUE, plt=FALSE, rtn=TRUE,
        ped = TRUE)



