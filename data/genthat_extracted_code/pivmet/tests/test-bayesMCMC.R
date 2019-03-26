context("Univariate MCMC")

N <- 40
k<- 2
p <- rep(1/k,k)
x <- 3
nMC <- 5000
stdev=cbind(rep(1,k), rep(200,k))
Mu=seq(-trunc(k/2)*x,trunc(k/2)*x,length=k)
W=c(0.2,0.8)
sim <- sim_mixture(N,k,Mu,stdev,W=W)
output_bayes <- bayesMCMC(sim$y, N, k, nMC)
relab_est <- pivotal_relabelling(output_bayes$mu_switch,
  output_bayes$groupPost,
  output_bayes$available_met,
  output_bayes$Diana,  Mu=output_bayes$Mu, nMC = nMC)

#
#
#
test_that("MCMC_2", {
  expect_error(output_bayes <- bayesMCMC(sim$y, N, k, nMC) )
  #expect_error(output_bayes <- bayesMCMC(sim$y, N, k, nMC) )
  expect_error(relab_est <-pivotal_relabelling(output_bayes$mu_switch,output_bayes$groupPost,
    output_bayes$available_met,
    output_bayes$Diana,  Mu=output_bayes$Mu, nMC = nMC))
  expect_error( plot_pivotal(sim$y,
    relab_est$mu_rel_median,
    relab_est$mu_rel_complete,
    type="chains",
    pivotal.criterion=2,
    output_bayes$mu_switch,
    relab_est$Final_it, output_bayes$Mu))
  expect_error( plot_pivotal(sim$y,
    relab_est$mu_rel_median,
    relab_est$mu_rel_complete,
    type="estimates",
    pivotal.criterion=2,
    output_bayes$mu_switch,
    relab_est$Final_it, output_bayes$Mu))
  expect_error( plot_pivotal(sim$y,
    relab_est$mu_rel_median,
    relab_est$mu_rel_complete,
    type="estimates_hist",
    pivotal.criterion=2,
    output_bayes$mu_switch,
    relab_est$Final_it, output_bayes$Mu))

})
#
#
k<- 3
p <- rep(1/k,k)
x <- 3
nMC <- 5000
stdev=cbind(rep(1,k), rep(200,k))
Mu=seq(-trunc(k/2)*x,trunc(k/2)*x,length=k)
W=c(0.2,0.8)
sim <- sim_mixture(N,k,Mu,stdev,W=W)
output_bayes <- bayesMCMC(sim$y, N, k, nMC)
relab_est <-pivotal_relabelling(output_bayes$mu_switch,
  output_bayes$groupPost,
  output_bayes$available_met,
  output_bayes$Diana,  Mu=output_bayes$Mu, nMC = nMC)
#
#
#
test_that("MCMC_3", {
  expect_error(output_bayes <- bayesMCMC(sim$y, N, k, nMC) )
  #expect_error(output_bayes <- bayesMCMC(sim$y, N, k, nMC) )
  expect_error(relab_est <-pivotal_relabelling(output_bayes$mu_switch,output_bayes$groupPost,
    output_bayes$available_met,
    output_bayes$Diana,  Mu=output_bayes$Mu, nMC = nMC))
  expect_error( plot_pivotal(sim$y,
    relab_est$mu_rel_median,
    relab_est$mu_rel_complete,
    type="chains",
    pivotal.criterion=2,
    output_bayes$mu_switch,
    relab_est$Final_it, output_bayes$Mu))
  expect_error( plot_pivotal(sim$y,
    relab_est$mu_rel_median,
    relab_est$mu_rel_complete,
    type="estimates",
    pivotal.criterion=2,
    output_bayes$mu_switch,
    relab_est$Final_it, output_bayes$Mu))
  expect_error( plot_pivotal(sim$y,
    relab_est$mu_rel_median,
    relab_est$mu_rel_complete,
    type="estimates_hist",
    pivotal.criterion=2,
    output_bayes$mu_switch,
    relab_est$Final_it, output_bayes$Mu))

})
#
#
k<- 4
p <- rep(1/k,k)
x <- 3
nMC <- 5000
stdev=cbind(rep(1,k), rep(200,k))
Mu=seq(-trunc(k/2)*x,trunc(k/2)*x,length=k)
W=c(0.2,0.8)
sim <- sim_mixture(N,k,Mu,stdev,W=W)
output_bayes <- bayesMCMC(sim$y, N, k, nMC)
relab_est <-pivotal_relabelling(output_bayes$mu_switch
  ,output_bayes$groupPost,
  output_bayes$available_met,
  output_bayes$Diana,  Mu=output_bayes$Mu, nMC = nMC)




test_that("MCMC_4", {
  expect_error(output_bayes <- bayesMCMC(sim$y, N, k, nMC) )
  #expect_error(output_bayes <- bayesMCMC(sim$y, N, k, nMC) )
  expect_error(relab_est <-pivotal_relabelling(output_bayes$mu_switch,output_bayes$groupPost,
    output_bayes$available_met,
    output_bayes$Diana,  Mu=output_bayes$Mu, nMC = nMC))
  expect_error( plot_pivotal(sim$y,
    relab_est$mu_rel_median,
    relab_est$mu_rel_complete,
    type="chains",
    pivotal.criterion=2,
    output_bayes$mu_switch,
    relab_est$Final_it, output_bayes$Mu))
  expect_error( plot_pivotal(sim$y,
    relab_est$mu_rel_median,
    relab_est$mu_rel_complete,
    type="estimates",
    pivotal.criterion=2,
    output_bayes$mu_switch,
    relab_est$Final_it, output_bayes$Mu))
  expect_error( plot_pivotal(sim$y,
    relab_est$mu_rel_median,
    relab_est$mu_rel_complete,
    type="estimates_hist",
    pivotal.criterion=2,
    output_bayes$mu_switch,
    relab_est$Final_it, output_bayes$Mu))

})

k<- 5
p <- rep(1/k,k)
x <- 3
nMC <- 5000
stdev=cbind(rep(1,k), rep(200,k))
Mu=seq(-trunc(k/2)*x,trunc(k/2)*x,length=k)
W=c(0.2,0.8)
sim <- sim_mixture(N,k,Mu,stdev,W=W)
output_bayes <- bayesMCMC(sim$y, N, k, nMC)
relab_est <-pivotal_relabelling(output_bayes$mu_switch
  ,output_bayes$groupPost,
  output_bayes$available_met,
  output_bayes$Diana,  Mu=output_bayes$Mu, nMC = nMC)

#
#
test_that("MCMC_5", {
  expect_error(output_bayes <- bayesMCMC(sim$y, N, k, nMC) )
  #expect_error(output_bayes <- bayesMCMC(sim$y, N, k, nMC) )
  expect_error(relab_est <-pivotal_relabelling(output_bayes$mu_switch,output_bayes$groupPost,
    output_bayes$available_met,
    output_bayes$Diana,  Mu=output_bayes$Mu, nMC = nMC))
  expect_error( plot_pivotal(sim$y,
    relab_est$mu_rel_median,
    relab_est$mu_rel_complete,
    type="chains",
    pivotal.criterion=2,
    output_bayes$mu_switch,
    relab_est$Final_it, output_bayes$Mu))
  expect_error( plot_pivotal(sim$y,
    relab_est$mu_rel_median,
    relab_est$mu_rel_complete,
    type="estimates",
    pivotal.criterion=2,
    output_bayes$mu_switch,
    relab_est$Final_it, output_bayes$Mu))
  expect_error( plot_pivotal(sim$y,
    relab_est$mu_rel_median,
    relab_est$mu_rel_complete,
    type="estimates_hist",
    pivotal.criterion=2,
    output_bayes$mu_switch,
    relab_est$Final_it, output_bayes$Mu))

})

k<- 6
p <- rep(1/k,k)
x <- 3
nMC <- 5000
stdev=cbind(rep(1,k), rep(200,k))
Mu=seq(-trunc(k/2)*x,trunc(k/2)*x,length=k)
W=c(0.2,0.8)
sim <- sim_mixture(N,k,Mu,stdev,W=W)
output_bayes <- bayesMCMC(sim$y, N, k, nMC)
relab_est <- pivotal_relabelling(output_bayes$mu_switch,
   output_bayes$groupPost,
   output_bayes$available_met,
   output_bayes$Diana,  Mu=output_bayes$Mu, nMC = nMC)



test_that("MCMC_6", {
  expect_error(output_bayes <- bayesMCMC(sim$y, N, k, nMC) )
  #expect_error(output_bayes <- bayesMCMC(sim$y, N, k, nMC) )
  expect_error(relab_est <-pivotal_relabelling(output_bayes$mu_switch,output_bayes$groupPost,
    output_bayes$available_met,
    output_bayes$Diana,  Mu=output_bayes$Mu, nMC = nMC))
  expect_error( plot_pivotal(sim$y,
    relab_est$mu_rel_median,
    relab_est$mu_rel_complete,
    type="chains",
    pivotal.criterion=2,
    output_bayes$mu_switch,
    relab_est$Final_it, output_bayes$Mu))
  expect_error( plot_pivotal(sim$y,
    relab_est$mu_rel_median,
    relab_est$mu_rel_complete,
    type="estimates",
    pivotal.criterion=2,
    output_bayes$mu_switch,
    relab_est$Final_it, output_bayes$Mu))
  expect_error( plot_pivotal(sim$y,
    relab_est$mu_rel_median,
    relab_est$mu_rel_complete,
    type="estimates_hist",
    pivotal.criterion=2,
    output_bayes$mu_switch,
    relab_est$Final_it, output_bayes$Mu))

})
