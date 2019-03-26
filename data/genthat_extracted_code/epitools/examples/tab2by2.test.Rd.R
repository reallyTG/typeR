library(epitools)


### Name: tab2by2.test
### Title: Comparative tests of independence in rx2 contigency tables
### Aliases: tab2by2.test
### Keywords: htest

### ** Examples


##Case-control study assessing whether exposure to tap water
##is associated with cryptosporidiosis among AIDS patients

tapw <- c("Lowest", "Intermediate", "Highest")
outc <- c("Case", "Control")	
dat <- matrix(c(2, 29, 35, 64, 12, 6),3,2,byrow=TRUE)
dimnames(dat) <- list("Tap water exposure" = tapw, "Outcome" = outc)
tab2by2.test(dat, rev="c")




