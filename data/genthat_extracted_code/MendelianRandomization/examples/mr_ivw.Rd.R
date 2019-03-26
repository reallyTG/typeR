library(MendelianRandomization)


### Name: mr_ivw
### Title: Inverse-variance weighted method
### Aliases: mr_ivw mr_ivw,MRInput-method

### ** Examples

mr_ivw(mr_input(bx = ldlc, bxse = ldlcse, by = chdlodds, byse = chdloddsse))
mr_ivw(mr_input(bx = ldlc, bxse = ldlcse, by = chdlodds, byse = chdloddsse),
  robust = TRUE)
mr_ivw(mr_input(bx = ldlc, bxse = ldlcse, by = chdlodds, byse = chdloddsse),
  penalized = TRUE)
mr_ivw(mr_input(calcium, calciumse, fastgluc, fastglucse, corr=calc.rho))
  ## correlated variants




