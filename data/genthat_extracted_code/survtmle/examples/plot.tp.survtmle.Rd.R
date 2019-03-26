library(survtmle)


### Name: plot.tp.survtmle
### Title: Plot Results of Cumulative Incidence Estimates
### Aliases: plot.tp.survtmle

### ** Examples

library(survtmle)
set.seed(341796)
n <- 100
t_0 <- 10
W <- data.frame(W1 = runif(n), W2 = rbinom(n, 1, 0.5))
A <- rbinom(n, 1, 0.5)
T <- rgeom(n,plogis(-4 + W$W1 * W$W2 - A)) + 1
C <- rgeom(n, plogis(-6 + W$W1)) + 1
ftime <- pmin(T, C)
ftype <- as.numeric(ftime == T)
suppressWarnings(
  fit <- survtmle(ftime = ftime, ftype = ftype,
                  adjustVars = W, glm.ftime = "I(W1*W2) + trt + t",
                  trt = A, glm.ctime = "W1 + t", method = "hazard",
                  verbose = TRUE,  t0 = t_0, maxIter = 2)
)
tpfit <- timepoints(fit, times = seq_len(t_0))
plot(tpfit)



