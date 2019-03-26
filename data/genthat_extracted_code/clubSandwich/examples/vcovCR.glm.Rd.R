library(clubSandwich)


### Name: vcovCR.glm
### Title: Cluster-robust variance-covariance matrix for a glm object.
### Aliases: vcovCR.glm

### ** Examples


data(dietox, package = "geepack")
dietox$Cu <- as.factor(dietox$Cu)
weight_fit <- glm(Weight ~ Cu * poly(Time, 3), data=dietox, family = "quasipoisson")
V_CR <- vcovCR(weight_fit, cluster = dietox$Pig, type = "CR2")
coef_test(weight_fit, vcov = V_CR, test = "Satterthwaite")




