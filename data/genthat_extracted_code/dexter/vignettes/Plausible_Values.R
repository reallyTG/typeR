## ----setup, include=FALSE------------------------------------------------
library(knitr)
opts_chunk$set(echo = TRUE)

par_hook = function(before, options, envir)
{
  if(before)
  {
    do.call(par, options$par)
  }
}
knit_hooks$set(par = par_hook)

library(dexter)

## ------------------------------------------------------------------------
x_plus = 10
delta = runif(20, -2, 2)
repeat 
{
  abil = rnorm(1, 0, 1)
  y_plus = 0
  for (i in 1:20) y_plus = y_plus + 1*(rlogis(1, 0, 1) <= (abil-delta[i]))
  if (x_plus == y_plus) break
}
pv = abil

## ------------------------------------------------------------------------
sim_Rasch = function(theta, delta) {
  n = length(theta)
  m = length(delta)
  data.frame(
    person_id = rep(paste0('p',1:n), m),
    item_id = rep(paste0('i',1:m), each=n),
    item_score = as.integer(rlogis(n*m, outer(theta, delta, "-")) > 0)
  )
}

sim_Rasch(rnorm(5),c(-.5,0,.8))

## ------------------------------------------------------------------------
sim_PV = function(theta, delta) {
  simulated_data = sim_Rasch(theta, delta) 
  parms = fit_enorm(simulated_data)
  plot(ecdf(theta-mean(theta)), main=paste(length(delta), "items"),bty='l')
  pv = plausible_values(simulated_data, parms, nPV = 10)
  for (i in 1:10) lines(ecdf(pv[[i+3]]-mean(pv[[i+3]])), col=rgb(.7,.7,.7,.5))
  lines(ecdf(theta-mean(theta)))
  invisible(NULL)
}

## ----fig.align='center', results='hide',fig.height=4,fig.width=4---------
theta = rnorm(300)
delta = runif(50, -2, 1)
sim_PV(theta, delta)

## ----fig.align='center', results='hide', fig.width=7,par=list(mfrow=c(1,1))----
grp = sample(2, 300, replace = TRUE, prob = c(.5,.5))
theta = rnorm(300, mean = c(-2,2)[grp], sd = c(1,1)[grp])
plot(density(theta),bty='l',main='')
par(mfrow=c(1,3))
sim_PV(theta, delta[1:10])
sim_PV(theta, delta[1:20])
sim_PV(theta, delta)

## ------------------------------------------------------------------------
sim_PV2 = function(theta, delta) {
  simulated_data = sim_Rasch(theta, delta) 
  parms = fit_enorm(simulated_data, method="Bayes", nIterations = 50)
  plot(ecdf(theta-mean(theta)), main=paste(length(delta), "items"),bty='l')
  which.draw=5*(1:10)
  for (iter in 1:10) {
    pv = plausible_values(simulated_data, parms, use_draw=which.draw[iter])
    lines(ecdf(pv$PV1-mean(pv$PV1)), col=rgb(.7,.7,.7,.5))
  }
  lines(ecdf(theta-mean(theta)))
}

## ----make_pv2, results='hide',fig.align='center',fig.width=7, par=list(mfrow=c(1,3))----
sim_PV2(theta, delta[1:10])
sim_PV2(theta, delta[1:20])
sim_PV2(theta, delta)

## ----make_pv3, results='hide',fig.align='center',fig.width=7,par=list(mfrow=c(1,3))----
sim_Rasch2 = function(theta, delta,group) {
  n = length(theta)
  m = length(delta)
  data.frame(
    person_id = rep(paste0('p',1:n), m),
    item_id = rep(paste0('i',1:m), each=n),
    item_score = as.integer(rlogis(n*m, outer(theta, delta, "-")) > 0),
    group=group
  )
}

sim_PV3 = function(theta, delta, group) {
  simulated_data = sim_Rasch2(theta, delta,group) 
  parms = fit_enorm(simulated_data)
  plot(ecdf(theta-mean(theta)), main=paste(length(delta), "items"),bty='l')
  pv = plausible_values(simulated_data, parms, covariates="group", nPV = 10)
  for (i in 1:10) lines(ecdf(pv[[i+3]]-mean(pv[[i+3]])), col=rgb(.7,.7,.7,.5))
  lines(ecdf(theta-mean(theta)))
  invisible(NULL)
}


sim_PV3(theta, delta[1:10],grp)
sim_PV3(theta, delta[1:20],grp)
sim_PV3(theta, delta,grp)


