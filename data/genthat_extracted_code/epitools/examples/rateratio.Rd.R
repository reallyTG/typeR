library(epitools)


### Name: rateratio
### Title: Rate ratio estimation and confidence intervals
### Aliases: rateratio rateratio.midp rateratio.wald
### Keywords: models

### ** Examples


##Examples from Rothman 1998, p. 238
bc <- c(Unexposed = 15, Exposed = 41)
pyears <- c(Unexposed = 19017, Exposed = 28010)
dd <- matrix(c(41,15,28010,19017),2,2)
dimnames(dd) <- list(Exposure=c("Yes","No"), Outcome=c("BC","PYears"))
##midp
rateratio(bc,pyears)
rateratio(dd, rev = "r")
rateratio(matrix(c(15, 41, 19017, 28010),2,2))
rateratio(c(15, 41, 19017, 28010))

##midp
rateratio.midp(bc,pyears)
rateratio.midp(dd, rev = "r")
rateratio.midp(matrix(c(15, 41, 19017, 28010),2,2))
rateratio.midp(c(15, 41, 19017, 28010))

##wald
rateratio.wald(bc,pyears)
rateratio.wald(dd, rev = "r")
rateratio.wald(matrix(c(15, 41, 19017, 28010),2,2))
rateratio.wald(c(15, 41, 19017, 28010))



