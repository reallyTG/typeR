library(sigr)


### Name: resampleTestAUC
### Title: Wrap AUC resampling test results.
### Aliases: resampleTestAUC

### ** Examples


set.seed(25325)
d <- data.frame(x1=c(1,2,3,4,5,6,7,7),
                y=c(FALSE,TRUE,FALSE,FALSE,
                    TRUE,TRUE,FALSE,TRUE))
resampleTestAUC(d,'x1','y',TRUE)





