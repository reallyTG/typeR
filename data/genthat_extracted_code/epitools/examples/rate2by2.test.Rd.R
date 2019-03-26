library(epitools)


### Name: rate2by2.test
### Title: Comparative tests of independence in rx2 rate tables
### Aliases: rate2by2.test
### Keywords: htest

### ** Examples

##Examples from Rothman 1998, p. 238
bc <- c(Unexposed = 15, Exposed = 41)
pyears <- c(Unexposed = 19017, Exposed = 28010)
dd <- matrix(c(41,15,28010,19017),2,2)
dimnames(dd) <- list(Exposure=c("Yes","No"), Outcome=c("BC","PYears"))
##midp
rate2by2.test(bc,pyears)
rate2by2.test(dd, rev = "r")
rate2by2.test(matrix(c(15, 41, 19017, 28010),2,2))
rate2by2.test(c(15, 41, 19017, 28010))



