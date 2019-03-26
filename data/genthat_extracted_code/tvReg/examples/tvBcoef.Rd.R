library(tvReg)


### Name: tvBcoef
### Title: Coefficient Array of an Estimated tvVAR
### Aliases: tvBcoef tvBcoef.tvvar

### ** Examples

data(Canada, package="vars")
var.2p <- vars::VAR(Canada, p = 2, type = "const")
tvvar.2p <- tvVAR(Canada, p=2, type= "const")
B <- vars::Bcoef(var.2p)
tvB <- tvBcoef(tvvar.2p)




