library(fuzzyforest)
library(mvtnorm)
context("Regression Test")

test_that("Regression Test", {
  skip_on_cran()
  set.seed(5)
  regression_sim <- function(n, mod_sizes, beta_pos, beta_vals, rho=.8, sd=.1){
    sim_mod <- function(n,p,corr) {
      sigma <- matrix(corr, nrow=p, ncol=p)
      diag(sigma) <- 1
      X <- rmvnorm(n, sigma=sigma)
      return(X)
    }
    number_of_mods <- length(mod_sizes)
    for(i in 1:number_of_mods){
      all_modules <- lapply(1:(number_of_mods - 1),
                            function(j) sim_mod(n, mod_sizes[j], rho))
    }
    all_modules[[number_of_mods]] <- matrix(rnorm(mod_sizes[number_of_mods]*n),
                                            nrow=n, ncol=mod_sizes[number_of_mods])
    X <- do.call(cbind, all_modules)
    p <- dim(X)[2]
    beta <- rep(0, sum(mod_sizes))
    beta[beta_pos] <- beta_vals
    y <- X%*%beta + rnorm(n, sd=sd)
    X <- as.data.frame(X)
    names(X) <- paste("V", 1:p, sep="")
    out <- list(X=X, y=y, beta=beta)
  }

  reg_dat <- regression_sim(n=1000, mod_sizes=c(10, 10, 10, 10),
                            beta_pos=c(1:3, 31:33),
                            beta_vals=c(5, 5, 5, 5, 5, 5), sd=.05)
  X <- reg_dat$X
  y <- reg_dat$y
  sc <- screen_control(drop_fraction = 0.25, keep_fraction = 0.75,
                       mtry_factor = 1, min_ntree = 500, ntree_factor = 1)
  se <- select_control(drop_fraction = 0.25, number_selected = 10,
                       mtry_factor = .5, min_ntree = 500,
                       ntree_factor = 1)
  dat <- as.data.frame(cbind(y, X))
  mod_membership <- factor(rep(1:4, each=10))
  fit <- ff(X, y,
            module_membership = mod_membership,
            screen_params=sc,
            select_params=se,
            final_ntree=500)
  expect_equal(paste("V", c(1:3, 31:33), sep="") %in% fit$feature_list$feature_name,
               rep(T, 6))
  fit <- ff(y ~ ., data = dat,
            module_membership = mod_membership,
            screen_params=sc,
            select_params=se,
            final_ntree=500)
  expect_equal(paste("V", c(1:3, 31:33), sep="") %in% fit$feature_list$feature_name,
               rep(T, 6))
  if (requireNamespace("WGCNA", quietly = T)) {
      library(WGCNA)
      fit <- wff(X, y,
                 screen_params = sc,
                 select_params = se,
                 final_ntree = 500)
      expect_equal(paste("V", c(1:3, 31:33), sep="") %in% fit$feature_list$feature_name,
                   rep(T, 6))
      fit <- wff(y ~ ., data = dat,
                 screen_params = sc,
                 select_params = se,
                 final_ntree = 500)
      expect_equal(paste("V", c(1:3, 31:33), sep="") %in% fit$feature_list$feature_name,
                   rep(T, 6))
  }
  #Now test whether Z works
  Z <- X[, 1:2]
  Xsub <- X[, -c(1, 2)]
  mod_membership <- factor(rep(1:4, times=c(8, 10, 10, 10)))
  fit <- ff(Xsub, y, Z,
            module_membership = mod_membership,
            screen_params=sc,
            select_params=se,
            final_ntree=500)
  expect_equal(paste("V", 1:4, sep="") %in% fit$feature_list$feature_name,
               rep(T, 4))
})
