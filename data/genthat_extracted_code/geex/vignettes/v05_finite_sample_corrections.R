## ---- echo = TRUE, eval=FALSE--------------------------------------------
#  correct_by_nothing <- function(components){
#    A <- grab_bread(components)
#    B <- grab_meat(components)
#    compute_sigma(A = A, B = B)
#  }

## ---- echo = TRUE--------------------------------------------------------
bias_correction <- function(components, b){
  A <- grab_bread(components)
  A_i <- grab_bread_list(components)
  B_i <- grab_meat_list(components)
  Ainv <- solve(A)

  H_i <- lapply(A_i, function(m){
    diag( (1 - pmin(b, diag(m %*% Ainv) ) )^(-0.5) )
  })

  Bbc_i <- lapply(seq_along(B_i), function(i){
    H_i[[i]] %*% B_i[[i]] %*% H_i[[i]]
  })
  Bbc   <- apply(simplify2array(Bbc_i), 1:2, sum)

  compute_sigma(A = A, B = Bbc)
}

## ----FAY1_eefun, echo = TRUE---------------------------------------------
gee_eefun <- function(data, formula, family){
  X <- model.matrix(object = formula, data = data)
  Y <- model.response(model.frame(formula = formula, data = data))
  n <- nrow(X)
  function(theta, alpha, psi){
    mu  <- family$linkinv(X %*% theta)
    Dt  <- t(X) %*% diag(as.numeric(mu), nrow = n)
    A   <- diag(as.numeric(family$variance(mu)), nrow = n)
    R   <- matrix(alpha, nrow = n, ncol = n)
    diag(R) <- 1
    V   <- psi * (sqrt(A) %*% R %*% sqrt(A))
    Dt %*% solve(V) %*% (Y - mu)
  }
}

## ----setup_gee, echo = TRUE, message = FALSE, results = 'hide'-----------
g <- gee::gee(breaks~tension, id=wool, data=warpbreaks, corstr="exchangeable")
guo <- saws::geeUOmega(g)

## ----correction_run, echo = TRUE-----------------------------------------
library(geex)
results <- m_estimate(
  estFUN = gee_eefun, data  = warpbreaks, 
  units = 'wool', roots = coef(g), compute_roots = FALSE,
  outer_args = list(formula = breaks ~ tension, 
                      family  = gaussian()),
  inner_args = list(alpha   = g$working.correlation[1,2], 
                      psi     = g$scale), 
  corrections = list(
   bias_correction_.1 = correction(bias_correction, b = .1),
   bias_correction_.3 = correction(bias_correction, b = .3))) 

## ----correction_comparison, echo = FALSE, results = 'hide'---------------
saws::saws(guo, method = 'd1')$V 
vcov(results)

saws::saws(guo, method = 'd4', bound  = 0.1)$V
get_corrections(results)[[1]]

saws::saws(guo, method = 'd4', bound  = 0.3)$V
get_corrections(results)[[2]]

