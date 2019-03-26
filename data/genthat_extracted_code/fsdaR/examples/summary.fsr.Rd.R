library(fsdaR)


### Name: summary.fsr
### Title: Summary Method for FSR objects
### Aliases: summary.fsr print.summary.fsr
### Keywords: multivariate robust

### ** Examples


    data(Animals, package = "MASS")
    brain <- Animals[c(1:24, 26:25, 27:28),]
    lbrain <- log(brain)
    (fs <- fsreg(brain~body, data=lbrain, method="FS"))
    summary(fs)




