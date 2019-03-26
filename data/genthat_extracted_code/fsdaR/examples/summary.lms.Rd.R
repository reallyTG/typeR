library(fsdaR)


### Name: summary.fsdalms
### Title: Summary Method for 'fsdalms' objects
### Aliases: summary.fsdalms print.summary.fsdalms
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
    



