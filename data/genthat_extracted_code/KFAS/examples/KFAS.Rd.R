library(KFAS)


### Name: KFAS
### Title: KFAS: Functions for Exponential Family State Space Models
### Aliases: KFAS KFAS-package

### ** Examples


# Example of local level model for Nile series
# See Durbin and Koopman (2012)

model_Nile <- SSModel(Nile ~
  SSMtrend(1, Q = list(matrix(NA))), H = matrix(NA))
model_Nile
model_Nile <- fitSSM(model_Nile, c(log(var(Nile)), log(var(Nile))),
  method = "BFGS")$model

# Filtering and state smoothing
out_Nile <- KFS(model_Nile, filtering = "state", smoothing = "state")
out_Nile

# Confidence and prediction intervals for the expected value and the observations.
# Note that predict uses original model object, not the output from KFS.
conf_Nile <- predict(model_Nile, interval = "confidence", level = 0.9)
pred_Nile <- predict(model_Nile, interval = "prediction", level = 0.9)

ts.plot(cbind(Nile, pred_Nile, conf_Nile[, -1]), col = c(1:2, 3, 3, 4, 4),
        ylab = "Predicted Annual flow", main = "River Nile")


# Missing observations, using the same parameter estimates

NileNA <- Nile
NileNA[c(21:40, 61:80)] <- NA
model_NileNA <- SSModel(NileNA ~ SSMtrend(1, Q = list(model_Nile$Q)),
H = model_Nile$H)

out_NileNA <- KFS(model_NileNA, "mean", "mean")

# Filtered and smoothed states
ts.plot(NileNA, fitted(out_NileNA, filtered = TRUE), fitted(out_NileNA),
  col = 1:3, ylab = "Predicted Annual flow",
  main = "River Nile")


# Example of multivariate local level model with only one state
# Two series of average global temperature deviations for years 1880-1987
# See Shumway and Stoffer (2006), p. 327 for details

data("GlobalTemp")

model_temp <- SSModel(GlobalTemp ~ SSMtrend(1, Q = NA, type = "common"),
  H = matrix(NA, 2, 2))

# Estimating the variance parameters
inits <- chol(cov(GlobalTemp))[c(1, 4, 3)]
inits[1:2] <- log(inits[1:2])
fit_temp <- fitSSM(model_temp, c(0.5*log(.1), inits), method = "BFGS")

out_temp <- KFS(fit_temp$model)

ts.plot(cbind(model_temp$y, coef(out_temp)), col = 1:3)
legend("bottomright",
  legend = c(colnames(GlobalTemp), "Smoothed signal"), col = 1:3, lty = 1)


## Not run: 
##D # Seatbelts data
##D # See Durbin and Koopman (2012)
##D 
##D model_drivers <- SSModel(log(drivers) ~ SSMtrend(1, Q = list(NA))+
##D    SSMseasonal(period = 12, sea.type = "trigonometric", Q = NA) +
##D    log(PetrolPrice) + law, data = Seatbelts, H = NA)
##D 
##D # As trigonometric seasonal contains several disturbances which are all
##D # identically distributed, default behaviour of fitSSM is not enough,
##D # as we have constrained Q. We can either provide our own
##D # model updating function with fitSSM, or just use optim directly:
##D 
##D # option 1:
##D ownupdatefn <- function(pars, model){
##D   model$H[] <- exp(pars[1])
##D   diag(model$Q[, , 1]) <- exp(c(pars[2], rep(pars[3], 11)))
##D   model #for optim, replace this with -logLik(model) and call optim directly
##D }
##D 
##D fit_drivers <- fitSSM(model_drivers,
##D   log(c(var(log(Seatbelts[, "drivers"])), 0.001, 0.0001)),
##D   ownupdatefn, method = "BFGS")
##D 
##D out_drivers <- KFS(fit_drivers$model, smoothing = c("state", "mean"))
##D out_drivers
##D ts.plot(out_drivers$model$y, fitted(out_drivers), lty = 1:2, col = 1:2,
##D   main = "Observations and smoothed signal with and without seasonal component")
##D lines(signal(out_drivers, states = c("regression", "trend"))$signal,
##D   col = 4, lty = 1)
##D legend("bottomleft", col = c(1, 2, 4), lty = c(1, 2, 1),
##D   legend = c("Observations", "Smoothed signal", "Smoothed level"))
##D 
##D # Multivariate model with constant seasonal pattern,
##D # using the the seat belt law dummy only for the front seat passangers,
##D # and restricting the rank of the level component by using custom component
##D 
##D model_drivers2 <- SSModel(log(cbind(front, rear)) ~ -1 +
##D     log(PetrolPrice) + log(kms) +
##D     SSMregression(~law, data = Seatbelts, index = 1) +
##D     SSMcustom(Z = diag(2), T = diag(2), R = matrix(1, 2, 1),
##D       Q = matrix(1), P1inf = diag(2)) +
##D     SSMseasonal(period = 12, sea.type = "trigonometric"),
##D   data = Seatbelts, H = matrix(NA, 2, 2))
##D 
##D # An alternative way for defining the rank deficient trend component:
##D 
##D # model_drivers2 <- SSModel(log(cbind(front, rear)) ~ -1 +
##D #     log(PetrolPrice) + log(kms) +
##D #     SSMregression(~law, data = Seatbelts, index = 1) +
##D #     SSMtrend(degree = 1, Q = list(matrix(0, 2, 2))) +
##D #     SSMseasonal(period = 12, sea.type = "trigonometric"),
##D #   data = Seatbelts, H = matrix(NA, 2, 2))
##D #
##D # Modify model manually:
##D # model_drivers2$Q <- array(1, c(1, 1, 1))
##D # model_drivers2$R <- model_drivers2$R[, -2, , drop = FALSE]
##D # attr(model_drivers2, "k") <- 1L
##D # attr(model_drivers2, "eta_types") <- attr(model_drivers2, "eta_types")[1]
##D 
##D 
##D likfn <- function(pars, model, estimate = TRUE){
##D   diag(model$H[, , 1]) <- exp(0.5 * pars[1:2])
##D   model$H[1, 2, 1] <- model$H[2, 1, 1] <-
##D     tanh(pars[3]) * prod(sqrt(exp(0.5 * pars[1:2])))
##D   model$R[28:29] <- exp(pars[4:5])
##D   if(estimate) return(-logLik(model))
##D   model
##D }
##D 
##D fit_drivers2 <- optim(f = likfn, p = c(-8, -8, 1, -1, -3), method = "BFGS",
##D   model = model_drivers2)
##D model_drivers2 <- likfn(fit_drivers2$p, model_drivers2, estimate = FALSE)
##D model_drivers2$R[28:29, , 1]%*%t(model_drivers2$R[28:29, , 1])
##D model_drivers2$H
##D 
##D out_drivers2 <- KFS(model_drivers2)
##D out_drivers2
##D ts.plot(signal(out_drivers2, states = c("custom", "regression"))$signal,
##D   model_drivers2$y, col = 1:4)
##D 
##D # For confidence or prediction intervals, use predict on the original model
##D pred <- predict(model_drivers2,
##D   states = c("custom", "regression"), interval = "prediction")
##D 
##D # Note that even though the intervals were computed without seasonal pattern,
##D # PetrolPrice induces seasonal pattern to predictions
##D ts.plot(pred$front, pred$rear, model_drivers2$y,
##D   col = c(1, 2, 2, 3, 4, 4, 5, 6), lty = c(1, 2, 2, 1, 2, 2, 1, 1))
## End(Not run)

## Simulate ARMA(2, 2) process
set.seed(1)
y <- arima.sim(n = 1000, list(ar = c(0.8897, -0.4858), ma = c(-0.2279, 0.2488)),
               innov = rnorm(1000) * sqrt(0.5))


model_arima <- SSModel(y ~ SSMarima(ar = c(0, 0), ma = c(0, 0), Q = 1), H = 0)

likfn <- function(pars, model, estimate = TRUE){
  tmp <- try(SSMarima(artransform(pars[1:2]), artransform(pars[3:4]),
    Q = exp(pars[5])), silent = TRUE)
  if(!inherits(tmp, "try-error")){
    model["T", "arima"] <- tmp$T
    model["R", "arima"] <- tmp$R
    model["P1", "arima"] <- tmp$P1
    model["Q", "arima"] <- tmp$Q
    if(estimate){
      -logLik(model)
    } else model
  } else {
    if(estimate){
      1e100
    } else model
  }
}

fit_arima <- optim(par = c(rep(0, 4), log(1)), fn = likfn, method = "BFGS",
  model = model_arima)
model_arima <- likfn(fit_arima$par, model_arima, FALSE)

# AR coefficients:
model_arima$T[2:3, 2, 1]
# MA coefficients:
model_arima$R[3:4]
# sigma2:
model_arima$Q[1]
# intercept
KFS(model_arima)
# same with arima:
arima(y, c(2, 0, 2))
# small differences because the intercept is handled differently in arima

## Not run: 
##D # Poisson model
##D # See Durbin and Koopman (2012)
##D model_van <- SSModel(VanKilled ~ law + SSMtrend(1, Q = list(matrix(NA)))+
##D                SSMseasonal(period = 12, sea.type = "dummy", Q = NA),
##D                data = Seatbelts, distribution = "poisson")
##D 
##D # Estimate variance parameters
##D fit_van <- fitSSM(model_van, c(-4, -7), method = "BFGS")
##D 
##D model_van <- fit_van$model
##D 
##D # use approximating model, gives posterior modes
##D out_nosim <- KFS(model_van, nsim = 0)
##D # State smoothing via importance sampling
##D out_sim <- KFS(model_van, nsim = 1000)
##D 
##D out_nosim
##D out_sim
## End(Not run)

## using deterministic inputs in observation and state equations
model_Nile <- SSModel(Nile ~ 
  SSMcustom(Z=1, T = 1, R = 0, a1 = 100, P1inf = 0, P1 = 0, Q = 0, state_names = "d_t") +
  SSMcustom(Z=0, T = 1, R = 0, a1 = 100, P1inf = 0, P1 = 0, Q = 0, state_names = "c_t") +
  SSMtrend(1, Q = 1500), H = 15000)
model_Nile$T
model_Nile$T[1, 3, 1] <- 1 # add c_t to level
model_Nile0 <- SSModel(Nile ~ 
  SSMtrend(2, Q = list(1500, 0), a1 = c(0, 100), P1inf = diag(c(1, 0))), 
  H = 15000)

ts.plot(KFS(model_Nile0)$mu, KFS(model_Nile)$mu, col = 1:2)

##########################################################
### Examples of generalized linear modelling with KFAS ###
##########################################################

# Same example as in ?glm
counts <- c(18, 17, 15, 20, 10, 20, 25, 13, 12)
outcome <- gl(3, 1, 9)
treatment <- gl(3, 3)
glm_D93 <- glm(counts ~ outcome + treatment, family = poisson())

model_D93 <- SSModel(counts ~ outcome + treatment,
  distribution = "poisson")

out_D93 <- KFS(model_D93)
coef(out_D93, last = TRUE)
coef(glm_D93)

summary(glm_D93)$cov.s
out_D93$V[, , 1]

# approximating model as in GLM
out_D93_nosim <- KFS(model_D93, smoothing = c("state", "signal", "mean"))

# with importance sampling. Number of simulations is too small here,
# with large enough nsim the importance sampling actually gives
# very similar results as the approximating model in this case
set.seed(1)
out_D93_sim <- KFS(model_D93,
  smoothing = c("state", "signal", "mean"), nsim = 1000)


## linear predictor
# GLM
glm_D93$linear.predictor
# approximate model, this is the posterior mode of p(theta|y)
c(out_D93_nosim$thetahat)
# importance sampling on theta, gives E(theta|y)
c(out_D93_sim$thetahat)


## predictions on response scale
# GLM
fitted(glm_D93)
# approximate model with backtransform, equals GLM
fitted(out_D93_nosim)
# importance sampling on exp(theta)
fitted(out_D93_sim)

# prediction variances on link scale
# GLM
as.numeric(predict(glm_D93, type = "link", se.fit = TRUE)$se.fit^2)
# approx, equals to GLM results
c(out_D93_nosim$V_theta)
# importance sampling on theta
c(out_D93_sim$V_theta)


# prediction variances on response scale
# GLM
as.numeric(predict(glm_D93, type = "response", se.fit = TRUE)$se.fit^2)
# approx, equals to GLM results
c(out_D93_nosim$V_mu)
# importance sampling on theta
c(out_D93_sim$V_mu)

# A Gamma example modified from ?glm
# Now with log-link, and identical intercept terms
clotting <- data.frame(
u = c(5,10,15,20,30,40,60,80,100),
lot1 = c(118,58,42,35,27,25,21,19,18),
lot2 = c(69,35,26,21,18,16,13,12,12))

model_gamma <- SSModel(cbind(lot1, lot2) ~ -1 + log(u) +
    SSMregression(~ 1, type = "common", remove.intercept = FALSE),
  data = clotting, distribution = "gamma")

update_shapes <- function(pars, model) {
  model$u[, 1] <- pars[1]
  model$u[, 2] <- pars[2]
  model
}
fit_gamma <- fitSSM(model_gamma, inits = c(1, 1), updatefn = update_shapes,
method = "L-BFGS-B", lower = 0, upper = 100)
logLik(fit_gamma$model)
KFS(fit_gamma$model)
fit_gamma$model["u", times = 1]



## Not run: 
##D ####################################
##D ### Linear mixed model with KFAS ###
##D ####################################
##D 
##D # example from ?lmer of lme4 pacakge
##D data("sleepstudy", package = "lme4")
##D 
##D model_lmm <- SSModel(Reaction ~ Days +
##D     SSMregression(~ Days, Q = array(0, c(2, 2, 180)),
##D        P1 = matrix(NA, 2, 2), remove.intercept = FALSE), sleepstudy, H = NA)
##D 
##D # The first 10 time points the third and fouth state
##D # defined with SSMregression correspond to the first subject, and next 10 time points
##D # are related to second subject and so on.
##D 
##D # need to use ordinary $ assignment as [ assignment operator for SSModel
##D # object guards against dimension altering
##D model_lmm$T <- array(model_lmm["T"], c(4, 4, 180))
##D attr(model_lmm, "tv")[3] <- 1L #needs to be integer type!
##D 
##D # "cut the connection" between the subjects
##D times <- seq(10, 180, by = 10)
##D model_lmm["T",states = 3:4, times = times] <- 0
##D 
##D # for the first subject the variance of the random effect is defined via P1
##D # for others, we use Q
##D model_lmm["Q", times = times] <- NA
##D 
##D update_lmm <- function(pars = init, model){
##D   P1 <- diag(exp(pars[1:2]))
##D   P1[1, 2] <- pars[3]
##D   model["P1", states = 3:4] <- model["Q", times = times] <-
##D     crossprod(P1)
##D   model["H"] <- exp(pars[4])
##D   model
##D }
##D 
##D inits <- c(0, 0, 0, 3)
##D 
##D fit_lmm <- fitSSM(model_lmm, inits, update_lmm, method = "BFGS")
##D out_lmm <- KFS(fit_lmm$model)
##D # unconditional covariance matrix of random effects
##D fit_lmm$model["P1", states = 3:4]
##D 
##D # conditional covariance matrix of random effects
##D # same for each subject and time point due to model structure
##D # these differ from the ones obtained from lmer as these are not conditioned
##D # on the fixed effects
##D out_lmm$V[3:4,3:4,1]
## End(Not run)
## Not run: 
##D # Example of Cubic spline smoothing
##D # See Durbin and Koopman (2012)
##D require("MASS")
##D data("mcycle")
##D 
##D model <- SSModel(accel ~ -1 +
##D     SSMcustom(Z = matrix(c(1, 0), 1, 2),
##D       T = array(diag(2), c(2, 2, nrow(mcycle))),
##D       Q = array(0, c(2, 2, nrow(mcycle))),
##D       P1inf = diag(2), P1 = diag(0, 2)), data = mcycle)
##D 
##D model$T[1, 2, ] <- c(diff(mcycle$times), 1)
##D model$Q[1, 1, ] <- c(diff(mcycle$times), 1)^3/3
##D model$Q[1, 2, ] <- model$Q[2, 1, ] <- c(diff(mcycle$times), 1)^2/2
##D model$Q[2, 2, ] <- c(diff(mcycle$times), 1)
##D 
##D 
##D updatefn <- function(pars, model, ...){
##D   model["H"] <- exp(pars[1])
##D   model["Q"] <- model["Q"] * exp(pars[2])
##D   model
##D }
##D 
##D fit <- fitSSM(model, inits = c(4, 4), updatefn = updatefn, method = "BFGS")
##D 
##D pred <- predict(fit$model, interval = "conf", level = 0.95)
##D plot(x = mcycle$times, y = mcycle$accel, pch = 19)
##D lines(x = mcycle$times, y = pred[, 1])
##D lines(x = mcycle$times, y = pred[, 2], lty = 2)
##D lines(x = mcycle$times, y = pred[, 3], lty = 2)
## End(Not run)





