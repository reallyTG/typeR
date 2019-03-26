library(fuzzyforest)
library(mvtnorm)
context("Multi-class Logistic Regression Simulation")

test_that("Multi-Class Simulation", {
 skip_on_cran()
 set.seed(5)
 multi_class_lr <- function(n, mod1_size=10, mod2_size=10, rho=.8, beta=NULL){
  #Say there are 5 significant features.
  #We will assume a multinomial logistic regression.
  J <- 5 #J=number of outcomes
  #signalp refers to the dimensionality of module which
  #the significant covariates are a part of.
  signalp <- mod1_size
  if(is.null(beta)){
    beta <- diag(rep(5, 4))
    beta <- rbind(beta, matrix(0, signalp - 4, 4))
  }
  sigma <- matrix(rho, signalp, signalp)
  diag(sigma) <- 1
  signalX <- rmvnorm(n, mean=rep(0, signalp), sigma=sigma)

  y <- rep(NA, n)
  pimat <- matrix(NA, n, J)
  for(i in 1:n){
    lps <- signalX[i, ]%*%beta
    den <- 1 + sum(exp(lps))
    #first category is the reference category
    #pi1 = 1/(1 + sum(exp(x_{j}'b_{j}))
    pi <- c(1, exp(lps))/den
    pimat[i, ] <- pi
    outcm <- rmultinom(1, size=1, prob=pi)
    y[i] <- which(outcm == 1)
  }

  #additional noise covariates
  noisep <- mod2_size
  sigma <- matrix(rho, noisep, noisep)
  diag(sigma) <- 1
  noise <- rmvnorm(n, mean=rep(0, noisep), sigma=sigma)
  X <- cbind(signalX, noise)
  X <- as.data.frame(X)
  y <- as.factor(y)
  out <- list(X=X, y=y, beta=beta)
}


  mc_dat <- multi_class_lr(n=1000, mod1_size=10, mod2_size=10)
  X <- mc_dat$X
  y <- mc_dat$y
  sc <- screen_control(drop_fraction = 0.25, keep_fraction = 0.75,
    mtry_factor = 1, min_ntree = 500, ntree_factor = 1)
  se <- select_control(drop_fraction = 0.2, number_selected = 4,
                 mtry_factor = 1, min_ntree = 500,
                 ntree_factor = 1)
  dat <- as.data.frame(cbind(y, X))
  mod_membership <- factor(rep(1:2, times=c(10, 10)))
  fit <- ff(X, y,
            module_membership = mod_membership,
            screen_params=sc,
            select_params=se,
            final_ntree=500)
  expect_equal(paste("V", 1:4, sep="") %in% fit$feature_list$feature_name,
               rep(T, 4))
  fit <- ff(y ~ ., data = dat,
            module_membership = mod_membership,
            screen_params=sc,
            select_params=se,
            final_ntree=500)
  expect_equal(paste("V", 1:4, sep="") %in% fit$feature_list$feature_name,
               rep(T, 4))
  if (requireNamespace("WGCNA", quietly = T)) {
      library(WGCNA)
      fit <- wff(X, y,
                 screen_params = sc,
                 select_params = se,
                 final_ntree = 500)
      expect_equal(paste("V", 1:4, sep="") %in% fit$feature_list$feature_name,
                   rep(T, 4))
      fit <- wff(y ~ ., data = dat,
                 screen_params = sc,
                 select_params = se,
                 final_ntree = 500)
      expect_equal(paste("V", 1:4, sep="") %in% fit$feature_list$feature_name,
                   rep(T, 4))
  }
  #Now test whether Z works
  Z <- X[, 1:2]
  Xsub <- X[, -c(1, 2)]
  mod_membership <- factor(rep(1:2, times=c(8, 10)))
  fit <- ff(Xsub, y, Z,
            module_membership = mod_membership,
            screen_params=sc,
            select_params=se,
            final_ntree=500)
  expect_equal(paste("V", 1:4, sep="") %in% fit$feature_list$feature_name,
               rep(T, 4))

})
