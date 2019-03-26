library(tvReg)


### Name: tvAcoef
### Title: Time-Varying Coefficient Arrays of the Lagged Endogenous
###   Variables of a tv-VAR (no intercept).
### Aliases: tvAcoef tvAcoef.tvvar

### ** Examples

data(Canada, package="vars")
var.2p <- vars::VAR(Canada, p = 2, type = "const")
tvvar.2p <- tvVAR(Canada, p = 2, type = "const")
A <- vars::Acoef(var.2p)
tvA <- tvAcoef(tvvar.2p)




