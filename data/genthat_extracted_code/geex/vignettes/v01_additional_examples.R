## ---- echo = TRUE--------------------------------------------------------
library(geex)

## ----SB4_estFUN, echo = TRUE---------------------------------------------
SB4_estFUN <- function(data){
  Z1 <- data$Z1; W1 <- data$W1; Y3 <- data$Y3
  function(theta){
      c(theta[1] - Z1,
        theta[2] - W1,
        (Y3 - (theta[3] * W1)) * (theta[2] - W1),
        (Y3 - (theta[4] * W1)) * (theta[1] - Z1)
    )
  }
}

## ----SB4_run, echo = TRUE, message=FALSE---------------------------------
estimates <- m_estimate(
  estFUN = SB4_estFUN, 
  data  = geexex, 
  root_control = setup_root_control(start = c(1, 1, 1, 1)))

## ----SB4_clsform, echo = TRUE, message = FALSE, results = 'hide'---------
ivfit <- AER::ivreg(Y3 ~ W1 | Z1, data = geexex)
iv_se <- ivpack::cluster.robust.se(ivfit, clusterid = 1:nrow(geexex))

## ----SB4_results, echo = TRUE--------------------------------------------
coef(ivfit)[2] 
coef(estimates)[4]
iv_se[2, 'Std. Error'] 
sqrt(vcov(estimates)[4, 4])

## ----SB5_internals, echo = TRUE------------------------------------------
F0 <- function(y, theta0, distrFUN = pnorm){
  distrFUN(y - theta0, mean = 0)
}

f0 <- function(y, densFUN){
  densFUN(y, mean = 0)
}

integrand <- function(y, densFUN = dnorm){
  f0(y, densFUN = densFUN)^2
}

IC_denom <- integrate(integrand, lower = -Inf, upper = Inf)$value

## ----SB5_estFUN, echo = TRUE---------------------------------------------
SB5_estFUN <- function(data){
  Yi <- data[['Y2']]
  function(theta){

     (1/IC_denom) * (F0(Yi, theta[1]) - 0.5)
  }
}

## ----SB5_run, echo = TRUE, message=FALSE---------------------------------
estimates <- m_estimate(
  estFUN = SB5_estFUN, 
  data  = geexex,
  root_control = setup_root_control(start = 2))

## ----SB5_clsform, echo = TRUE--------------------------------------------
theta_cls <- ICSNP::hl.loc(geexex$Y2)
Sigma_cls <- 1/(12 * IC_denom^2) / nrow(geexex)

## ----SB5_results, echo = FALSE-------------------------------------------
results <- list(geex = list(parameters = coef(estimates), vcov = vcov(estimates)), 
                cls = list(parameters = theta_cls, vcov = Sigma_cls))
results

## ----SB6_estFUN, echo = TRUE---------------------------------------------
SB6_estFUN <- function(data, k = 1.5){
  Y1 <- data$Y1
  function(theta){
    x <- Y1 - theta[1]
    if(abs(x) <= k) x else sign(x) * k
  }
}

## ----SB6_run, echo = TRUE, message=FALSE---------------------------------
estimates <- m_estimate(
  estFUN = SB6_estFUN, 
  data  = geexex,
  root_control = setup_root_control(start = 3))

## ----SB6_clsform, echo = TRUE--------------------------------------------
theta_cls <- MASS::huber(geexex$Y1, k = 1.5, tol = 1e-10)$mu

psi_k <- function(x, k = 1.5){
  if(abs(x) <= k) x else sign(x) * k
}

A <- mean(unlist(lapply(geexex$Y1, function(y){
  x <- y - theta_cls
  -numDeriv::grad(psi_k, x = x)
})))

B <- mean(unlist(lapply(geexex$Y1, function(y){
  x <- y - theta_cls
  psi_k(x = x)^2
})))

## closed form covariance
Sigma_cls <- matrix(1/A * B * 1/A / nrow(geexex))

## ----SB6_results, echo = TRUE--------------------------------------------
results <- list(geex = list(parameters = coef(estimates), vcov = vcov(estimates)), 
                cls = list(parameters = theta_cls, vcov = Sigma_cls))
results

## ----SB7_estFUN, echo = TRUE---------------------------------------------
SB7_estFUN <- function(data){
  Y1 <- data$Y1
  function(theta){
    0.5  - (Y1 <= theta[1])
  }
}

## ----approx--------------------------------------------------------------
spline_approx <- function(psi, eval_theta){
  y <- Vectorize(psi)(eval_theta)
  f <- splinefun(x = eval_theta, y = y)
  function(theta) f(theta)
}

## ----SB7_run, echo = TRUE, message=FALSE---------------------------------
estimates <- m_estimate(
  estFUN = SB7_estFUN, 
  data  = geexex, 
  root_control = setup_root_control(start = 4.7),
  approx_control  = setup_approx_control(FUN = spline_approx,
                                      eval_theta = seq(3, 6, by = .05)))

## ----SB7_results, echo = FALSE-------------------------------------------
results <- list(geex = list(parameters = coef(estimates), vcov = vcov(estimates)), 
                cls = list(parameters = median(geexex$Y1), vcov = NA))
results

## ----SB8_estFUN, echo = TRUE---------------------------------------------
psi_k <- function(x, k = 1.345){
  if(abs(x) <= k) x else sign(x) * k
}

SB8_estFUN <- function(data){
  Yi <- data$Y4
  xi <- model.matrix(Y4 ~ X1 + X2, data = data)
  function(theta){
    r <- Yi - xi %*% theta
    c(psi_k(r) %*% xi)
  }
}

## ----SB8_run, echo = TRUE, message = FALSE-------------------------------
estimates <- m_estimate(
  estFUN = SB8_estFUN, 
  data  = geexex,
  root_control = setup_root_control(start = c(0, 0, 0)))

## ----SB8_clsform, echo = TRUE--------------------------------------------
m <- MASS::rlm(Y4 ~ X1 + X2, data = geexex, method = 'M')
theta_cls <- coef(m)
Sigma_cls <- vcov(m)

## ----SB8_results, echo = TRUE--------------------------------------------
results <- list(geex = list(parameters = coef(estimates), vcov = vcov(estimates)), 
                cls = list(parameters = theta_cls, vcov = Sigma_cls))
results

## ----SB9_estFUN, echo = TRUE---------------------------------------------
SB9_estFUN <- function(data){
  Y <- data$Y5
  X <- model.matrix(Y5 ~ X1 + X2, data = data, drop = FALSE)
  function(theta){
    lp <- X %*% theta
    mu <- plogis(lp)
    D  <- t(X) %*% dlogis(lp)
    V  <- mu * (1 - mu)
    D %*% solve(V) %*% (Y - mu)
  }
}

## ----SB9_run, echo = TRUE, message = FALSE-------------------------------
estimates <- m_estimate(
  estFUN = SB9_estFUN, 
  data  = geexex, 
  root_control = setup_root_control(start = c(.1, .1, .5)))

## ----SB9_clsform, echo = TRUE--------------------------------------------
m9 <- glm(Y5 ~ X1 + X2, data = geexex, family = binomial(link = 'logit'))
theta_cls <- coef(m9)
Sigma_cls <- sandwich::sandwich(m9)

## ----SB9_results, echo = TRUE--------------------------------------------
results <- list(geex = list(parameters = coef(estimates), vcov = vcov(estimates)),  
                cls = list(parameters = theta_cls, vcov = Sigma_cls))
results

## ----SB10_setup, echo=FALSE----------------------------------------------
shaq <- data.frame(
  game = 1:23,
  ft_made = c(4, 5, 5, 5, 2, 7, 6, 9, 4, 1, 13, 5, 6, 9, 7, 3, 8, 1, 18, 3, 10, 1, 3),
  ft_attp = c(5, 11, 14, 12, 7, 10, 14, 15, 12, 4, 27, 17, 12, 9, 12, 10, 12, 6, 39, 13, 17, 6, 12))

## ----SB10_estFUN, echo = TRUE--------------------------------------------
SB10_estFUN <- function(data){
  Y <- data$ft_made
  n <- data$ft_attp
  function(theta){
    p <- theta[2]
    c(((Y - (n * p))^2)/(n * p * (1 - p))  - theta[1], 
      Y - n * p)
  }
}

## ----SB10_run, echo = TRUE-----------------------------------------------
estimates <- m_estimate(
  estFUN = SB10_estFUN, 
  data  = shaq, 
  units = 'game', 
  root_control = setup_root_control(start = c(.5, .5)))

## ----SB10_clsform, echo = TRUE-------------------------------------------
V11 <- function(p) {
  k    <- nrow(shaq)
  sumn <- sum(shaq$ft_attp)
  sumn_inv <- sum(1/shaq$ft_attp)
  term2_n  <- 1 - (6 * p) + (6 * p^2)
  term2_d <- p * (1 - p) 
  term2  <- term2_n/term2_d
  term3  <- ((1 - (2 * p))^2) / ((sumn/k) * p * (1 - p))
  2 + (term2 * (1/k) * sumn_inv) - term3
}

p_tilde <- sum(shaq$ft_made)/sum(shaq$ft_attp)
V11_hat <- V11(p_tilde)/23

# Compare variance estimates
V11_hat
vcov(estimates)[1, 1]

# Note the differences in the p-values
pnorm(35.51/23, mean  = 1, sd = sqrt(V11_hat), lower.tail = FALSE)

pnorm(coef(estimates)[1], 
      mean = 1, 
      sd = sqrt(vcov(estimates)[1, 1]),
      lower.tail = FALSE)

