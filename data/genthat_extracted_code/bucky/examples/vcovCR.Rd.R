library(bucky)


### Name: vcovCR
### Title: Clustered Robust Covariance Matrix Estimation
### Aliases: vcovCR
### Keywords: robust cluster

### ** Examples

clotting <- data.frame(
    cl = rep(1:2,each=9),
    u = c(5,10,15,20,30,40,60,80,100),
    lot = c(118,58,42,35,27,25,21,19,18,
            69,35,26,21,18,16,13,12,12))
clot.model <- glm(lot ~ log(u), data = clotting, family = Gamma)
vcovCR(clot.model, cluster=cl)

data(swiss)
model1 <- lm(Fertility ~ ., data = swiss)
## These should give the same answer
vcovCR(model1, cluster=1:nobs(model1), type="CR0")
sandwich::vcovHC(model1, type="HC0")



