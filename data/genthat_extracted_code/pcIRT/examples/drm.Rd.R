library(pcIRT)


### Name: DRM
### Title: Estimation of dichotomous logistic Rasch model (Rasch, 1960)
### Aliases: DRM print.DRM summary.DRM
### Keywords: continuous model rating scale

### ** Examples


#estimate Rasch model parameters
data(reason)
res_drm <- DRM(reason.test[,1:11])

summary(res_drm)





