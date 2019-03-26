library(extremefit)


### Name: cox.adapt
### Title: Compute the extreme quantile procedure for Cox model
### Aliases: cox.adapt

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

ca <- cox.adapt(X, cph, delta, Z)




