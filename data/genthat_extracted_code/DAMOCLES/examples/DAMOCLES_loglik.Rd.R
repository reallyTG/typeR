library(DAMOCLES)


### Name: DAMOCLES_loglik
### Title: Likelihood for DAMOCLES model
### Aliases: DAMOCLES_loglik
### Keywords: models

### ** Examples

  #TEST IT WORKS
  phy = rcoal(100)
  pars = c(0.5,0.1,0.1)
  pa = rbinom(100,c(0,1),0.5)
  pa = matrix(c(phy$tip.label,pa),nrow = length(phy$tip.label),ncol = 2)

  # - without a root edge
  loglik = DAMOCLES_loglik(phy,pa,pars)
  loglik

  # - with a root edge
  phy$root.edge = 2
  loglik = DAMOCLES_loglik(phy,pa,pars)
  loglik



