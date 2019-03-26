context("Bivariate MCMC")

M1 <- c(-.5,8)
M2 <- c(25.5,.1)
M3 <- c(49.5,8)
M4 <- c(49,0.1)
M5 <- c( 65, 0.1)
M6 <- c( 65, 8)
MacroMu <- matrix(c(M1, M2, M3, M4, M5, M6),6,2, byrow = TRUE)

N <- 50



k <- 2
nMC <- 5000
Mu <- matrix(NA,k,2)
for (h in 1:k){
  Mu[h,] <- MacroMu[h,]
}
stdev <- cbind(rep(1,k), rep(200,k))
Sigma.p1 <- matrix(c(stdev[1,1],0,0,stdev[1,1]), nrow=2, ncol=2)
Sigma.p2 <- matrix(c(stdev[1,2],0,0,stdev[1,2]), nrow=2, ncol=2)
W <- c(0.2,0.8)
sim <- sim_mixture(N,k,Mu,stdev,Sigma.p1,Sigma.p2,W)
output_bayes <- bayesMCMC(sim$y, N, k, nMC)
relab_est <- pivotal_relabelling(mu_switch =
    output_bayes$mu_switch,
    output_bayes$groupPost,
    output_bayes$available_met,
    output_bayes$Diana, Mu=output_bayes$Mu, nMC = nMC)

test_that("MCMC_biv_2", {
  expect_error(output_bayes <- bayesMCMC(sim$y, N, k, nMC) )
  expect_error(relab_est <- pivotal_relabelling(mu_switch =
    output_bayes$mu_switch,
    output_bayes$groupPost,
    output_bayes$available_met,
    output_bayes$Diana, Mu=output_bayes$Mu, nMC = nMC) )
})



k <- 3
nMC <- 5000
Mu <- matrix(NA,k,2)
for (h in 1:k){
  Mu[h,] <- MacroMu[h,]
}
stdev <- cbind(rep(1,k), rep(200,k))
Sigma.p1 <- matrix(c(stdev[1,1],0,0,stdev[1,1]), nrow=2, ncol=2)
Sigma.p2 <- matrix(c(stdev[1,2],0,0,stdev[1,2]), nrow=2, ncol=2)
W <- c(0.2,0.8)
sim <- sim_mixture(N,k,Mu,stdev,Sigma.p1,Sigma.p2,W)
output_bayes <- bayesMCMC(sim$y, N, k, nMC)
relab_est <- pivotal_relabelling(mu_switch =
    output_bayes$mu_switch,
  output_bayes$groupPost,
  output_bayes$available_met,
  output_bayes$Diana, Mu=output_bayes$Mu, nMC = nMC)

test_that("MCMC_biv_3", {
  expect_error(output_bayes <- bayesMCMC(sim$y, N, k, nMC) )
  expect_error(relab_est <- pivotal_relabelling(mu_switch =
      output_bayes$mu_switch,
    output_bayes$groupPost,
    output_bayes$available_met,
    output_bayes$Diana, Mu=output_bayes$Mu, nMC = nMC) )
})


k <- 4
nMC <- 5000
Mu <- matrix(NA,k,2)
for (h in 1:k){
  Mu[h,] <- MacroMu[h,]
}
stdev <- cbind(rep(1,k), rep(200,k))
Sigma.p1 <- matrix(c(stdev[1,1],0,0,stdev[1,1]), nrow=2, ncol=2)
Sigma.p2 <- matrix(c(stdev[1,2],0,0,stdev[1,2]), nrow=2, ncol=2)
W <- c(0.2,0.8)
sim <- sim_mixture(N,k,Mu,stdev,Sigma.p1,Sigma.p2,W)
output_bayes <- bayesMCMC(sim$y, N, k, nMC)
relab_est <- pivotal_relabelling(mu_switch =
    output_bayes$mu_switch,
  output_bayes$groupPost,
  output_bayes$available_met,
  output_bayes$Diana, Mu=output_bayes$Mu, nMC = nMC)

test_that("MCMC_biv_4", {
  expect_error(output_bayes <- bayesMCMC(sim$y, N, k, nMC) )
  expect_error(relab_est <- pivotal_relabelling(mu_switch =
      output_bayes$mu_switch,
    output_bayes$groupPost,
    output_bayes$available_met,
    output_bayes$Diana, Mu=output_bayes$Mu, nMC = nMC) )
})


k <- 5
nMC <- 5000
Mu <- matrix(NA,k,2)
for (h in 1:k){
  Mu[h,] <- MacroMu[h,]
}
stdev <- cbind(rep(1,k), rep(200,k))
Sigma.p1 <- matrix(c(stdev[1,1],0,0,stdev[1,1]), nrow=2, ncol=2)
Sigma.p2 <- matrix(c(stdev[1,2],0,0,stdev[1,2]), nrow=2, ncol=2)
W <- c(0.2,0.8)
sim <- sim_mixture(N,k,Mu,stdev,Sigma.p1,Sigma.p2,W)
output_bayes <- bayesMCMC(sim$y, N, k, nMC)
relab_est <- pivotal_relabelling(mu_switch =
    output_bayes$mu_switch,
  output_bayes$groupPost,
  output_bayes$available_met,
  output_bayes$Diana, Mu=output_bayes$Mu, nMC = nMC)

test_that("MCMC_biv_5", {
  expect_error(output_bayes <- bayesMCMC(sim$y, N, k, nMC) )
  expect_error(relab_est <- pivotal_relabelling(mu_switch =
      output_bayes$mu_switch,
    output_bayes$groupPost,
    output_bayes$available_met,
    output_bayes$Diana, Mu=output_bayes$Mu, nMC = nMC) )
})


k <- 6
nMC <- 5000
Mu <- matrix(NA,k,2)
for (h in 1:k){
  Mu[h,] <- MacroMu[h,]
}
stdev <- cbind(rep(1,k), rep(200,k))
Sigma.p1 <- matrix(c(stdev[1,1],0,0,stdev[1,1]), nrow=2, ncol=2)
Sigma.p2 <- matrix(c(stdev[1,2],0,0,stdev[1,2]), nrow=2, ncol=2)
W <- c(0.2,0.8)
sim <- sim_mixture(N,k,Mu,stdev,Sigma.p1,Sigma.p2,W)
output_bayes <- bayesMCMC(sim$y, N, k, nMC)
relab_est <- pivotal_relabelling(mu_switch =
    output_bayes$mu_switch,
  output_bayes$groupPost,
  output_bayes$available_met,
  output_bayes$Diana, Mu=output_bayes$Mu, nMC = nMC)

test_that("MCMC_biv_6", {
  expect_error(output_bayes <- bayesMCMC(sim$y, N, k, nMC) )
  expect_error(relab_est <- pivotal_relabelling(mu_switch =
      output_bayes$mu_switch,
    output_bayes$groupPost,
    output_bayes$available_met,
    output_bayes$Diana, Mu=output_bayes$Mu, nMC = nMC) )
})


