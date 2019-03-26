library(MendelianRandomization)


### Name: mr_maxlik
### Title: Maximum-likelihood method
### Aliases: mr_maxlik mr_maxlik,MRInput-method

### ** Examples

mr_maxlik(mr_input(bx = ldlc, bxse = ldlcse, by = chdlodds, byse = chdloddsse))
mr_maxlik(mr_input(bx = ldlc, bxse = ldlcse, by = chdlodds, byse = chdloddsse), psi=0.2)
mr_maxlik(mr_input(calcium, calciumse, fastgluc, fastglucse, corr=calc.rho))
  ## correlated variants




