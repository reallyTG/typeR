library(mev)


### Name: ibvpot
### Title: Interpret bivariate threshold exceedance models
### Aliases: ibvpot

### ** Examples

y <- evd::rgpd(1000,1,1,1)
x <- y*rmevspec(n=1000,d=2,sigma=cbind(c(0,0.5),c(0.5,0)),model="hr")
mod <- evd::fbvpot(x,threshold = c(1,1),model = "hr",likelihood ="censored")
ibvpot(mod, c(20,20))



