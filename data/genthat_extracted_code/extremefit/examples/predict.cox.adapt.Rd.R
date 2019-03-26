library(extremefit)


### Name: predict.cox.adapt
### Title: Predict the survival or quantile function from the extreme
###   procedure for the Cox model
### Aliases: predict.cox.adapt

### ** Examples


library(survival)
data(bladder)

X <- bladder2$stop-bladder2$start
Z <- as.matrix(bladder2[, c(2:4, 8)])
delta <- bladder2$event

ord <- order(X)
X <- X[ord]
Z <- Z[ord,]
delta <- delta[ord]

cph<-coxph(Surv(X, delta) ~ Z)

ca <- cox.adapt(X, cph, delta, bladder2[ord,])

xgrid <- X
newdata <- as.data.frame(cbind(xgrid,bladder2[ord,]))

Plac <- predict(ca, newdata = newdata, type = "survival")
Treat <- predict(ca, newdata = newdata, type = "survival")

PlacSA <- predict(ca, newdata = newdata,
                          type = "survival", aggregation = "simple", AggInd = c(10,20,30,40))
TreatSA <- predict(ca, newdata = newdata,
                          type = "survival", aggregation = "simple", AggInd = c(10,20,30,40))


PlacAA <- predict(ca, newdata = newdata,
                          type = "survival", aggregation = "adaptive", M=10)
TreatAA <- predict(ca, newdata = newdata,
                          type = "survival", aggregation = "adaptive", M=10)




