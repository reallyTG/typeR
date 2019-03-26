library(fsdaR)


### Name: summary.fsdalts
### Title: Summary Method for 'fsdalts' objects
### Aliases: summary.fsdalts print.summary.fsdalts
### Keywords: multivariate robust

### ** Examples


    data(Animals, package = "MASS")
    brain <- Animals[c(1:24, 26:25, 27:28),]
    lbrain <- log(brain)
    (fs <- fsreg(brain~body, data=lbrain, method="LTS"))
    summary(fs)

    ## compare to the result of ltsReg() from 'robustbase'
    (lts <- ltsReg(brain~body, data=lbrain))
    summary(lts)
    



