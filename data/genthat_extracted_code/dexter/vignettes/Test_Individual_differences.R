## ----setup, include=FALSE------------------------------------------------
library(knitr)
opts_chunk$set(echo = TRUE,dev='CairoPNG')

par_hook = function(before, options, envir)
{
  if(before)
  {
    do.call(par, options$par)
  }
}
knit_hooks$set(par = par_hook)

library(dexter)
library(dplyr)

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

simulated = sim_Rasch(rep(0.5, 2000), runif(20, -2, 2))

## ---- fig.align='center', fig.width=7,par=list(mfrow=c(1,2))-------------
ss= simulated %>% 
  group_by(person_id) %>% 
  summarise(sumscore=sum(item_score)) 

hist(ss$sumscore, main='', xlab='sumScore')
plot(ecdf(ss$sumscore), bty='l', main='ecdf', xlab='sumScore' )
mm = fit_inter(simulated)

## ---- fig.align='center', fig.width=7,par=list(mfrow=c(1,2))-------------
mm = fit_inter(simulated)

plot(mm, show.observed = TRUE, 
     items = c('i1','i2'))

## ---- fig.align='center', fig.height=4, fig.width=4----------------------
dd = individual_differences(simulated,degree=10)
plot(dd)

## ------------------------------------------------------------------------
print(dd)

## ---- fig.align='center', fig.height=4, fig.width=4----------------------
db2 = start_new_project(verbAggrRules, "verbAggression.db")
add_booklet(db2, verbAggrData, "data")
dd = individual_differences(db2, booklet_id=="data")
plot(dd)

## ---- show=FALSE---------------------------------------------------------
close_project(db2)

