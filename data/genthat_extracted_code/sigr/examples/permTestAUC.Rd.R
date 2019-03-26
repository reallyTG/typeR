library(sigr)


### Name: permTestAUC
### Title: Perform AUC permutation test.
### Aliases: permTestAUC

### ** Examples


set.seed(25325)
d <- data.frame(x1=c(1,2,3,4,5,6,7,7),
                y=c(FALSE,TRUE,FALSE,FALSE,
                    TRUE,TRUE,FALSE,TRUE))
permTestAUC(d,'x1','y',TRUE)





