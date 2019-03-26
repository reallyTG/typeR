library(daewr)


### Name: LGB
### Title: This function uses the LGB Method to detect significant effects
###   in unreplicated fractional factorials.
### Aliases: LGB
### Keywords: htest

### ** Examples

data(chem)
modf<-lm(y~A*B*C*D,data=chem)
LGB(coef(modf)[-1],rpt=FALSE)


## The function is currently defined as
LGB <- function(Beta, alpha=.05,rpt=TRUE, plt=TRUE, pltl=TRUE) {
sigLGB<-LGBc(Beta,alpha,rpt,plt,pltl)
}



