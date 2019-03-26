library(mvord)
library(Matrix)
rho <- list()
rho$ndim <- 5
rho$threshold.values <- list(c(NA),
                            c(NA,NA,NA),
                            c(NA,NA,NA),
                            c(NA,NA,NA,NA,NA),
                            c(NA,NA))
rho$ntheta <- sapply(rho$threshold.values, length)
rho$ind.thresholds <- list(1,2:4,5:7,8:12,13:14)

theta <- c(1,0,1,2,1,1,1,-5:-1, -10,-3)

mvord:::check(all.equal(mvord:::transf_thresholds_flexible(theta, rho), list(1,
                                                             c(0, exp(1), exp(1) + exp(2)),
                                                             c(1,1 + exp(1), 1+ exp(1) + exp(1)),
                                                             c(-5, -5 + exp(-4), -5 + exp(-4) + exp(-3), -5 + exp(-4) + exp(-3) +exp(-2), -5 + exp(-4) + exp(-3) + exp(-2) + exp(-1)),
                                                             c(-10, -10 + exp(-3)))))

rho$threshold.constraints <- c(1,2,2,3,4)
rho$ntheta <- sapply(rho$threshold.values, length)
rho$ind.thresholds <- list(1,2:4,2:4,5:9,10:11)

theta <- c(1,0,1,2,-5:-1, -10,-3)


mvord:::check(all.equal(mvord:::transf_thresholds_flexible(theta, rho), list(1,
                                                                             c(0, exp(1), exp(1) + exp(2)),
                                                                             c(0,exp(1), exp(1) + exp(2)),
                                                                             c(-5, -5 + exp(-4), -5 + exp(-4) + exp(-3), -5 + exp(-4) + exp(-3) +exp(-2), -5 + exp(-4) + exp(-3) + exp(-2) + exp(-1)),
                                                                             c(-10, -10 + exp(-3)))))
##################################################################################
rho$threshold.values <- list(1,
                             c(2,NA,NA),
                             c(3,NA,NA),
                             c(4,NA,NA,NA,NA),
                             c(-9,NA))
rho$ndim <- 5
rho$ntheta <- sapply(rho$threshold.values, length)
rho$npar.theta <- sapply(1:rho$ndim, function(j) sum(is.na(rho$threshold.values[[j]])))
rho$ind.thresholds <- list(c(),1:2,3:4,5:8,9)
rho$threshold.values.fixed <- lapply(1:rho$ndim, function(j){ind <- !is.na(rho$threshold.values[[j]])
rho$threshold.values[[j]][ind]})

rho$ncat.first.ind <- cumsum(c(1,rho$ntheta))[- (rho$ndim + 1)]
rho$inds.cat <- lapply(seq_len(rho$ndim), function(j)
  seq_len(rho$ntheta[j]) +  rho$ncat.first.ind[j] - 1)



rho$constraints <- as.data.frame(c(1,1,1,1,1,1,1,1,1,1,1,1,1,1), ncol = 1)
rho$contr_theta <- do.call("rbind", rep(list(diag(14)), 1))
## make function which compute correction factor for thresholds:
rho$mat_center_scale <- bdiag(rho$constraints) %*% 1

betatilde <- 0

rho$thold_correction <-lapply(seq_len(rho$ndim), mvord:::build_correction_thold_fun0, rho = rho)


theta <- c(1,0,1,2,1,1,-3,-10, -5)

mvord:::check(all.equal(mvord:::transf_thresholds_fix1_first(theta, rho, betatilde), list(1,
                                                               c(2, 2 + exp(1), 2 + exp(1) + exp(0)),
                                                               c(3, 3 + exp(1), 3 + exp(1)+ exp(2)),
                                                               c(4, 4+ exp(1), 4+ exp(1)+ exp(1), 4+ exp(1)+ exp(1)+ exp(-3),4+ exp(1)+ exp(1)+ exp(-3)+ exp(-10)),
                                                               c(-9, -9 + exp(-5)))))


rho$threshold.values <- list(1,
                             c(2,NA,NA),
                             c(2,NA,NA),
                             c(4,NA,NA,NA,NA),
                             c(-9,NA))
rho$ndim <- 5
rho$ntheta <- sapply(rho$threshold.values, length)
rho$npar.theta <- sapply(1:rho$ndim, function(j) sum(is.na(rho$threshold.values[[j]])))
rho$ind.thresholds <- list(c(),1:2,1:2,3:6,7)
rho$threshold.values.fixed <- lapply(1:rho$ndim, function(j){ind <- !is.na(rho$threshold.values[[j]])
rho$threshold.values[[j]][ind]})


rho$ncat.first.ind <- cumsum(c(1,rho$ntheta))[- (rho$ndim + 1)]
rho$inds.cat <- lapply(seq_len(rho$ndim), function(j)
  seq_len(rho$ntheta[j]) +  rho$ncat.first.ind[j] - 1)



rho$constraints <- as.data.frame(c(1,1,1,1,1,1,1,1,1,1,1,1,1,1), ncol = 1)
rho$contr_theta <- do.call("rbind", rep(list(diag(14)), 1))
## make function which compute correction factor for thresholds:
rho$mat_center_scale <- bdiag(rho$constraints) %*% 1

betatilde <- 0

theta <- c(1,0,1,1,-3,-10, -5)

mvord:::check(all.equal(mvord:::transf_thresholds_fix1_first(theta, rho, betatilde), list(1,
                                                                               c(2, 2 + exp(1), 2 + exp(1) + exp(0)),
                                                                               c(2, 2 + exp(1), 2 + exp(1) + exp(0)),
                                                                               c(4, 4+ exp(1), 4+ exp(1)+ exp(1), 4+ exp(1)+ exp(1)+ exp(-3),4+ exp(1)+ exp(1)+ exp(-3)+ exp(-10)),
                                                                               c(-9, -9 + exp(-5)))))


##################################################################################
rho$threshold.values <- list(1,
                             c(2,4,NA),
                             c(3,4,NA),
                             c(4,10,NA,NA,NA),
                             c(-9,-6))
rho$ndim <- 5
rho$ntheta <- sapply(rho$threshold.values, length)
rho$npar.theta <- sapply(1:rho$ndim, function(j) sum(is.na(rho$threshold.values[[j]])))
rho$ind.thresholds <- list(c(),1,2,3:5,c())
rho$threshold.values.fixed <- lapply(1:rho$ndim, function(j){ind <- !is.na(rho$threshold.values[[j]])
rho$threshold.values[[j]][ind]})

rho$first.ind.theta <- c(NA,1,2,3,NA)


rho$ncat.first.ind <- cumsum(c(1,rho$ntheta))[- (rho$ndim + 1)]
rho$inds.cat <- lapply(seq_len(rho$ndim), function(j)
  seq_len(rho$ntheta[j]) +  rho$ncat.first.ind[j] - 1)



rho$constraints <- as.data.frame(c(1,1,1,1,1,1,1,1,1,1,1,1,1,1), ncol = 1)
rho$contr_theta <- do.call("rbind", rep(list(diag(14)), 1))
## make function which compute correction factor for thresholds:
rho$mat_center_scale <- bdiag(rho$constraints) %*% 1

betatilde <- 0



gamma <- c(1,0,1,2,-10)

mvord:::check(all.equal(mvord:::transf_thresholds_fix2_first(gamma, rho, betatilde), list(1,
                                                               c(2, 4, 4 + exp(1)),
                                                               c(3, 4, 4 + exp(0)),
                                                               c(4,10, 10 + exp(1), 10 + exp(1) + exp(2),10 + exp(1) + exp(2) + exp(-10)),
                                                               c(-9, -6))))


rho$threshold.values <- list(1,
                             c(2,4,NA),
                             c(2,4,NA),
                             c(4,10,NA,NA,NA),
                             c(-9,-6))
rho$ndim <- 5
rho$ntheta <- sapply(rho$threshold.values, length)
rho$npar.theta <- sapply(1:rho$ndim, function(j) sum(is.na(rho$threshold.values[[j]])))
rho$ind.thresholds <- list(c(),1,1,2:4,c())
rho$threshold.values.fixed <- lapply(1:rho$ndim, function(j){ind <- !is.na(rho$threshold.values[[j]])
rho$threshold.values[[j]][ind]})

rho$first.ind.theta <- c(NA,1,1,2,NA)



rho$ncat.first.ind <- cumsum(c(1,rho$ntheta))[- (rho$ndim + 1)]
rho$inds.cat <- lapply(seq_len(rho$ndim), function(j)
  seq_len(rho$ntheta[j]) +  rho$ncat.first.ind[j] - 1)



rho$constraints <- as.data.frame(c(1,1,1,1,1,1,1,1,1,1,1,1,1,1), ncol = 1)
rho$contr_theta <- do.call("rbind", rep(list(diag(14)), 1))
## make function which compute correction factor for thresholds:
rho$mat_center_scale <- bdiag(rho$constraints) %*% 1

betatilde <- 0

gamma <- c(1,1,2,-10)

mvord:::check(all.equal(mvord:::transf_thresholds_fix2_first(gamma, rho, betatilde), list(1,
                                                                               c(2, 4, 4 + exp(1)),
                                                                               c(2, 4, 4 + exp(1)),
                                                                               c(4,10, 10 + exp(1), 10 + exp(1) + exp(2),10 + exp(1) + exp(2) + exp(-10)),
                                                                               c(-9, -6))))
##################################################################################
rho$threshold.values <- list(1,
                             c(2,NA,4),
                             c(2,NA,4),
                             c(4,NA,NA,NA,10),
                             c(-9,-6))
rho$ndim <- 5
rho$ntheta <- sapply(rho$threshold.values, length)
rho$npar.theta <- sapply(1:rho$ndim, function(j) sum(is.na(rho$threshold.values[[j]])))
rho$ind.thresholds <- list(c(),1,1,2:4,c())
rho$threshold.values.fixed <- lapply(1:rho$ndim, function(j){ind <- !is.na(rho$threshold.values[[j]])
rho$threshold.values[[j]][ind]})

gamma <- c(1,1,2,-10)

## (theta_j - theta_(j-1)/(1 - theta_j) = exp(gamma_j)/(1 + exp(gamma_j))
th41 <- exp(1)/(1 + exp(1))
th42 <- (exp(2) + th41)/(1 + exp(2))
th43 <- (exp(-10) + th42)/(1 + exp(-10))

mvord:::check(all.equal(mvord:::transf_thresholds_fix2_firstlast(gamma, rho, betatilde),
                        list(1,
                             c(2, c(exp(1)/(1 + exp(1))) *(4 - 2) + 2, 4),
                             c(2, c(exp(1)/(1 + exp(1))) *(4 - 2) + 2, 4),
                             c(4, c(th41, th42, th43) *(10 - 4) + 4, 10),
                             c(-9, -6))))

rho$threshold.values <- list(1,
                             c(2,NA,4),
                             c(3,NA,4),
                             c(4,NA,NA,NA,10),
                             c(-9,-6))
rho$ndim <- 5
rho$ntheta <- sapply(rho$threshold.values, length)
rho$npar.theta <- sapply(1:rho$ndim, function(j) sum(is.na(rho$threshold.values[[j]])))
rho$ind.thresholds <- list(c(),1,2,3:5,c())
rho$threshold.values.fixed <- lapply(1:rho$ndim, function(j){ind <- !is.na(rho$threshold.values[[j]])
rho$threshold.values[[j]][ind]})

gamma <- c(1,0,1,2,-10)

## (theta_j - theta_(j-1)/(1 - theta_j) = exp(gamma_j)/(1 + exp(gamma_j))
th41 <- exp(1)/(1 + exp(1))
th42 <- (exp(2) + th41)/(1 + exp(2))
th43 <- (exp(-10) + th42)/(1 + exp(-10))

mvord:::check(all.equal(mvord:::transf_thresholds_fix2_firstlast(gamma, rho, betatilde),
                        list(1,
                             c(2, c(exp(1)/(1 + exp(1))) *(4 - 2) + 2, 4),
                             c(3, c(exp(0)/(1 + exp(0))) *(4 - 3) + 3, 4),
                             c(4, c(th41, th42, th43) *(10 - 4) + 4, 10),
                             c(-9, -6))))

