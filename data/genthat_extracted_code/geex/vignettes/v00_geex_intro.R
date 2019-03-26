## ---- echo = FALSE, message = FALSE, warning=FALSE-----------------------
library(geex)
library(knitr)
opts_knit$set(progress = TRUE, verbose = TRUE)

## ----SB1_estfun, echo=TRUE, results='hide'-------------------------------
SB1_estfun <- function(data){
  Y1 <- data$Y1
  function(theta){
      c(Y1 - theta[1],
       (Y1 - theta[1])^2 - theta[2])
  }
}

## ----SB1_run, echo=TRUE, eval=TRUE, message=FALSE------------------------
library(geex)
results <- m_estimate(
    estFUN = SB1_estfun, 
    data   = geexex,
    root_control = setup_root_control(start = c(1,1)))

## ----SB1_clsform, echo=TRUE, eval = TRUE---------------------------------
n <- nrow(geexex)
A <- diag(1, nrow = 2)

B <- with(geexex, {
  Ybar <- mean(Y1)
  B11 <- mean( (Y1 - Ybar)^2 )
  B12 <- mean( (Y1 - Ybar) * ((Y1 - Ybar)^2 - B11) )
  B22 <- mean( ((Y1 - Ybar)^2 - B11)^2 )
  matrix(
    c(B11, B12,
      B12, B22), nrow = 2
  )
})

# closed form roots
theta_cls <- c(mean(geexex$Y1),
               # since var() divides by n - 1, not n
               var(geexex$Y1) * (n - 1)/ n ) 

# closed form sigma
Sigma_cls <- (solve(A) %*% B %*% t(solve(A))) / n

comparison <- list(geex = list(estimates = coef(results), vcov = vcov(results)), 
                   cls  = list(estimates = theta_cls, vcov = Sigma_cls))

## ----SB1_results, echo = FALSE-------------------------------------------
comparison

## ----SB2_eefun, echo = TRUE----------------------------------------------
SB2_estfun <- function(data){
  Y1 <- data$Y1; Y2 <- data$Y2
  function(theta){
      c(Y1 - theta[1],
        Y2 - theta[2],
        theta[1] - (theta[3] * theta[2]) 
    )
  }
}

## ----SB2_run, echo = TRUE, message = FALSE-------------------------------
results <- m_estimate(
    estFUN = SB2_estfun, 
    data  = geexex, 
    root_control = setup_root_control(start = c(1, 1, 1)))

## ----SB2_clsform, echo = TRUE--------------------------------------------
# Comparison to an analytically derived sanwich estimator
A <- with(geexex, {
 matrix(
  c(1 , 0, 0,
    0 , 1, 0,
    -1, mean(Y1)/mean(Y2), mean(Y2)),
  byrow = TRUE, nrow = 3)
})

B <- with(geexex, {
  matrix(
    c(var(Y1)   , cov(Y1, Y2), 0,
      cov(Y1, Y2), var(Y2)   , 0,
      0, 0, 0),
    byrow = TRUE, nrow = 3)
})

## closed form roots
theta_cls <- c(mean(geexex$Y1), mean(geexex$Y2))
theta_cls[3] <- theta_cls[1]/theta_cls[2]
## closed form covariance
Sigma_cls <- (solve(A) %*% B %*% t(solve(A))) / nrow(geexex)
comparison <- list(geex = list(estimates = coef(results), vcov = vcov(results)), 
                   cls  = list(estimates = theta_cls, vcov = Sigma_cls))

## ----SB2_results, echo = TRUE--------------------------------------------
comparison

## ----SB3_eefun, echo = TRUE, warning = FALSE, message=FALSE--------------
SB3_estfun <- function(data){
  Y1 <- data$Y1
  function(theta){
      c(Y1 - theta[1],
       (Y1 - theta[1])^2 - theta[2],
       sqrt(theta[2]) - theta[3],
       log(theta[2]) - theta[4])
  }
}

## ----SB3_run, echo = FALSE, message=FALSE--------------------------------
results <- m_estimate(
   estFUN= SB3_estfun, 
   data  = geexex,
   root_control = setup_root_control(start = rep(2, 4, 4, 4)))

## ----SB3_clsform, echo = TRUE--------------------------------------------
## closed form roots
theta_cls <- numeric(4)
theta_cls[1] <- mean(geexex$Y1)
theta_cls[2] <- sum((geexex$Y1 - theta_cls[1])^2)/nrow(geexex)
theta_cls[3] <- sqrt(theta_cls[2])
theta_cls[4] <- log(theta_cls[2])

## Compare to closed form ##
theta2 <- theta_cls[2]
mu3 <- moments::moment(geexex$Y1, order = 3, central = TRUE)
mu4 <- moments::moment(geexex$Y1, order = 4, central = TRUE)
## closed form covariance
Sigma_cls <- matrix(
  c(theta2, mu3, mu3/(2*sqrt(theta2)), mu3/theta2,
    mu3, mu4 - theta2^2, (mu4 - theta2^2)/(2*sqrt(theta2)), (mu4 - theta2^2)/theta2,
    mu3/(2 * sqrt(theta2)), (mu4 - theta2^2)/(2*sqrt(theta2)), (mu4 - theta2^2)/(4*theta2), (mu4 - theta2^2)/(2*theta2^(3/2)),
    mu3/theta2, (mu4 - theta2^2)/theta2, (mu4 - theta2^2)/(2*theta2^(3/2)), (mu4/theta2^2) - 1) ,
  nrow = 4, byrow = TRUE) / nrow(geexex)
## closed form covariance
# Sigma_cls <- (solve(A) %*% B %*% t(solve(A))) / n
comparison <- list(geex = list(estimates = coef(results), vcov = vcov(results)), 
                   cls  = list(estimates = theta_cls, vcov = Sigma_cls))

## ----SB3_results, echo = FALSE-------------------------------------------
comparison

