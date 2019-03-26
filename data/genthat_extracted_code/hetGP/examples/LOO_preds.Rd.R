library(hetGP)


### Name: LOO_preds
### Title: Leave one out predictions
### Aliases: LOO_preds

### ** Examples

set.seed(32)
## motorcycle data
library(MASS)
X <- matrix(mcycle$times, ncol = 1)
Z <- mcycle$accel
nvar <- 1

## Model fitting
model <- mleHomGP(X = X, Z = Z, lower = rep(0.1, nvar), upper = rep(10, nvar),
                  covtype = "Matern5_2", known = list(beta0 = 0))
LOO_p <- LOO_preds(model)
 
# model minus observation(s) at x_i
d_mot <- find_reps(X, Z)

LOO_ref <- matrix(NA, nrow(d_mot$X0), 2)
for(i in 1:nrow(d_mot$X0)){
 model_i <- mleHomGP(X = list(X0 = d_mot$X0[-i,, drop = FALSE], Z0 = d_mot$Z0[-i],
                     mult = d_mot$mult[-i]), Z = unlist(d_mot$Zlist[-i]),
                     lower = rep(0.1, nvar), upper = rep(50, nvar), covtype = "Matern5_2",
                     known = list(theta = model$theta, k_theta_g = model$k_theta_g, g = model$g,
                                  beta0 = 0))
 model_i$nu_hat <- model$nu_hat
 p_i <- predict(model_i, d_mot$X0[i,,drop = FALSE])
 LOO_ref[i,] <- c(p_i$mean, p_i$sd2)
}

# Compare results

range(LOO_ref[,1] - LOO_p$mean)
range(LOO_ref[,2] - LOO_p$sd2)

# Use of LOO for diagnostics
plot(model)



