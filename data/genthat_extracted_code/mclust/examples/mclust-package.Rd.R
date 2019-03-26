library(mclust)


### Name: mclust-package
### Title: Gaussian Mixture Modelling for Model-Based Clustering,
###   Classification, and Density Estimation
### Aliases: mclust-package mclust
### Keywords: package

### ** Examples


# Clustering
mod1 <- Mclust(iris[,1:4])
summary(mod1)
plot(mod1,  what = c("BIC", "classification"))

# Classification
data(banknote)
mod2 <- MclustDA(banknote[,2:7], banknote$Status)
summary(mod2)
plot(mod2)

# Density estimation
mod3 <- densityMclust(faithful$waiting)
summary(mod3)
plot(mod3, faithful$waiting)



