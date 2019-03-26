library(lava)


### Name: covariance
### Title: Add covariance structure to Latent Variable Model
### Aliases: covariance covariance<- covariance.lvm covariance<-.lvm
###   covfix<- covfix covfix<-.lvm covfix.lvm variance variance<-
###   variance.lvm variance<-.lvm
### Keywords: models regression

### ** Examples


m <- lvm()
### Define covariance between residuals terms of y1 and y2
covariance(m) <- y1~y2
covariance(m) <- c(y1,y2)~f(v) ## Same marginal variance
covariance(m) ## Examine covariance structure





