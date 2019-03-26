library(pcIRT)


### Name: CRSM
### Title: Estimation of Continuous Rating Scale Model (Mueller, 1987)
### Aliases: CRSM summary.CRSM print.CRSM print.CRSM summary.CRSM
### Keywords: continuous model rating scale

### ** Examples


#estimate CRSM item parameters
data(analog)
res_crsm <- CRSM(extraversion, low=-10, high=10)

summary(res_crsm)




