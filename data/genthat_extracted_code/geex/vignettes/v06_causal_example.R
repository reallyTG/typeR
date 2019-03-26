## ----packages, echo =TRUE------------------------------------------------
library(geex)
library(inferference)
library(dplyr)

## ----simulated_data, echo = TRUE-----------------------------------------
n <- 1000
x <- data_frame(
  A  = rbinom(n, 1, .2),
  Y0 = rnorm(n, 0, 1),
  Y1 = rnorm(n, 2 * A, 1),
  Y = (A*Y1) + (1 - A)*Y0)

## ----ipw_estfun, echo = TRUE---------------------------------------------
ipw_estFUN <- function(data){
  A <- data$A
  Y <- data$Y
  function(theta, phat){
    ipw0 <- 1/theta[1]
    ipw1 <- 1/theta[2]
    
    # Estimating functions #
    c( (1 - A) - theta[1],
      A - theta[2],
      
      # Estimating IP weight
      Y*(1 - A)*ipw0 - theta[3],
      Y*(A)*ipw1 - theta[4],  
      
      # Treating IP weight as known
      Y*A/phat - theta[5]
      )
  }
}

## ----ipw_estimation, echo = TRUE-----------------------------------------
phat <- mean(x$A)
out <- m_estimate(ipw_estFUN,
           data = x,
           inner_args = list(phat = phat),
           root_control = setup_root_control(start = c(.5, .5, 0, 0, 0)))

## ----ipw_comparison, echo = TRUE-----------------------------------------
## Comparing point estimates
all.equal(mean(x$Y * x$A/phat), coef(out)[4]) 
all.equal(phat, coef(out)[2]) 

## Comparing variance estimates
geex_vcov <- diag(vcov(out)) * n

# estimates match treating propensity as known
all.equal(var(x$Y * x$A/phat) * (n - 1)/n, geex_vcov[5])

# estimates match using influence function approach
y <- x$Y * x$A/phat - mean(x$Y * x$A/phat)
z <- (x$A - phat) / (phat*(1 - phat))
var(y - predict(lm(y ~ z))) - geex_vcov[4] # close

## ----eefun, echo=TRUE----------------------------------------------------
eefun <- function(data, model, alpha){
  X <- model.matrix(model, data = data)
  A <- model.response(model.frame(model, data = data))
  Y <- data$Y
  
  function(theta){
    p  <- length(theta)
    p1 <- length(coef(model))
    lp  <- X %*% theta[1:p1]
    rho <- plogis(lp)

    hh  <- ((rho/alpha)^A * ((1-rho)/(1-alpha))^(1 - A)) 
    IPW <- 1/(exp(sum(log(hh))))

    score_eqns <- apply(X, 2, function(x) sum((A - rho) * x))
    ce0 <- mean(Y * (A == 0)) * IPW / (1 - alpha)
    ce1 <- mean(Y * (A == 1)) * IPW / (alpha)
    
    c(score_eqns,
      ce0 - theta[p - 1],
      ce1 - theta[p])
  }
}

## ---- echo = FALSE-------------------------------------------------------
if(packageVersion('inferference') < '0.5.0'){
  vaccinesim$Y <- vaccinesim$y
}

## ----example2, echo =TRUE------------------------------------------------
test <- interference(
  formula = Y | A ~ X1 | group, 
  data   = vaccinesim,
  model_method = 'glm',
  allocations = c(.35, .4))

mglm <- glm(A ~ X1, data = vaccinesim, family = binomial)

ce_estimates <- m_estimate(
  estFUN = eefun,
  data  = vaccinesim,
  units = 'group',
  root_control = setup_root_control(start = c(coef(mglm), .4,  .13)),
  outer_args = list(alpha = .35, model = mglm)
)

roots(ce_estimates)

# Compare parameter estimates
direct_effect(test, allocation = .35)$estimate
roots(ce_estimates)[3] - roots(ce_estimates)[4]

# conpare SE estimates
L <- c(0, 0, 1, -1)
Sigma <- vcov(ce_estimates)
sqrt(t(L) %*% Sigma %*% L)  # from GEEX
direct_effect(test, allocation = .35)$std.error # from inferference

## ----dr_estfun, echo = TRUE----------------------------------------------
dr_estFUN <- function(data, models){
  
  Z <- data$Z
  Y <- data$Y
  
  Xe <- grab_design_matrix(
    data, rhs_formula = grab_fixed_formula(models$e))
  Xm0 <- grab_design_matrix(
    data, rhs_formula = grab_fixed_formula(models$m0))
  Xm1 <- grab_design_matrix(
    data, rhs_formula = grab_fixed_formula(models$m1))
  
  e_pos  <- 1:ncol(Xe)
  m0_pos <- (max(e_pos) + 1):(max(e_pos) + ncol(Xm0))
  m1_pos <- (max(m0_pos) + 1):(max(m0_pos) + ncol(Xm1))
  
  e_scores  <- grab_psiFUN(models$e, data)
  m0_scores <- grab_psiFUN(models$m0, data)
  m1_scores <- grab_psiFUN(models$m1, data)
  
  function(theta){
    e  <- plogis(Xe %*% theta[e_pos]) 
    m0 <- Xm0 %*% theta[m0_pos] 
    m1 <- Xm1 %*% theta[m1_pos] 
    rd_hat <- (Z*Y - (Z - e) * m1)/e - ((1 - Z) * Y - (Z - e) * m0)/(1 - e)
    c(e_scores(theta[e_pos]),
      m0_scores(theta[m0_pos]) * (Z == 0),
      m1_scores(theta[m1_pos]) * (Z == 1),
      rd_hat - theta[length(theta)])  
  }
}

## ----estimate_dr---------------------------------------------------------
estimate_dr <- function(data, propensity_formula, outcome_formula){
  e_model  <- glm(propensity_formula, data = data, family = binomial)
  m0_model <- glm(outcome_formula, subset = (Z == 0), data = data)
  m1_model <- glm(outcome_formula, subset = (Z == 1), data = data)
  models <- list(e = e_model, m0 = m0_model, m1 = m1_model)
  nparms <- sum(unlist(lapply(models, function(x) length(coef(x))))) + 1
  
  m_estimate(
    estFUN = dr_estFUN,
    data   = data,
    root_control = setup_root_control(start = rep(0, nparms)),
    outer_args = list(models = models))
}

## ----lunceford_simulation, echo = TRUE-----------------------------------
library(mvtnorm)
tau_0 <- c(-1, -1, 1, 1)
tau_1 <- tau_0 * -1
Sigma_X3 <- matrix(
   c(1, 0.5, -0.5, -0.5,
     0.5, 1, -0.5, -0.5,
     -0.5, -0.5, 1, 0.5,
     -0.5, -0.5, 0.5, 1), ncol = 4, byrow = TRUE)

gen_data <- function(n, beta, nu, xi){
  X3 <- rbinom(n, 1, prob = 0.2)
  V3 <- rbinom(n, 1, prob = (0.75 * X3 + (0.25 * (1 - X3))))
  hold <- rmvnorm(n,  mean = rep(0, 4), Sigma_X3)
  colnames(hold) <- c("X1", "V1", "X2", "V2")
  hold <- cbind(hold, X3, V3)
  hold <- apply(hold, 1, function(x){
    x[1:4] <- x[1:4] + tau_1^(x[5])*tau_0^(1 - x[5])
    x})
  hold <- t(hold)[, c("X1", "X2", "X3", "V1", "V2", "V3")]
  X <- cbind(Int = 1, hold)
  Z <- rbinom(n, 1, prob = plogis(X[, 1:4] %*% beta))
  X <- cbind(X[, 1:4], Z, X[, 5:7])
  data.frame(
    Y = X %*% c(nu, xi) + rnorm(n), 
    X[ , -1])
}


## ----dr_estimation-------------------------------------------------------
dt <- gen_data(1000, c(0, 0.6, -0.6, 0.6), c(0, -1, 1, -1, 2), c(-1, 1, 1))
geex_results <- estimate_dr(dt, Z ~ X1 + X2 + X3, Y ~ X1 + X2 + X3)

## ----dr_byhand-----------------------------------------------------------
e  <- predict(glm(Z ~ X1 + X2 + X3, data = dt, family = "binomial"),
              type = "response")
m0 <- predict(glm(Y ~ X1 + X2 + X3, data = dt, subset = Z==0), newdata = dt)
m1 <- predict(glm(Y ~ X1 + X2 + X3, data = dt, subset = Z==1), newdata = dt)
del_hat <- with(dt, mean( (Z * Y - (Z - e) * m1)/e)) - 
  with(dt, mean(((1 - Z) * Y - (Z - e) * m0)/(1 - e)))

