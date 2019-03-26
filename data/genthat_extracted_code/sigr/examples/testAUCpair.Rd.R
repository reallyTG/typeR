library(sigr)


### Name: testAUCpair
### Title: Test AUC pair results.
### Aliases: testAUCpair

### ** Examples


set.seed(25325)
d <- data.frame(x1=c(1,2,3,4,5,6,7,7),
                x2=1,
                y=c(FALSE,TRUE,FALSE,FALSE,
                    TRUE,TRUE,FALSE,TRUE))
testAUCpair(d,'x1','x2','y',TRUE)





