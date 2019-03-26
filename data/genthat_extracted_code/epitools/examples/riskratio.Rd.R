library(epitools)


### Name: riskratio
### Title: Risk ratio estimation and confidence intervals
### Aliases: riskratio riskratio.wald riskratio.small riskratio.boot
### Keywords: models

### ** Examples


##Case-control study assessing whether exposure to tap water
##is associated with cryptosporidiosis among AIDS patients

tapw <- c("Lowest", "Intermediate", "Highest")
outc <- c("Case", "Control")	
dat <- matrix(c(2, 29, 35, 64, 12, 6),3,2,byrow=TRUE)
dimnames(dat) <- list("Tap water exposure" = tapw, "Outcome" = outc)
riskratio(dat, rev="c")
riskratio.wald(dat, rev="c")
riskratio.small(dat, rev="c")

##Selvin 1998, p. 289
sel <- matrix(c(178, 79, 1411, 1486), 2, 2)
dimnames(sel) <- list("Behavior type" = c("Type A", "Type B"),
                       "Outcome" = c("CHD", "No CHD")
                      )
riskratio.boot(sel, rev = "b")
riskratio.boot(sel, rev = "b", verbose = TRUE)
riskratio(sel, rev = "b", method = "boot")




