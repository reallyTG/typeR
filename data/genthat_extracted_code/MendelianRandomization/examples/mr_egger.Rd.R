library(MendelianRandomization)


### Name: mr_egger
### Title: MR-Egger method
### Aliases: mr_egger mr_egger,MRInput-method

### ** Examples

mr_egger(mr_input(bx = ldlc, bxse = ldlcse, by = chdlodds, byse = chdloddsse))
mr_egger(mr_input(bx = ldlc, bxse = ldlcse, by = chdlodds, byse = chdloddsse),
  robust = TRUE)
mr_egger(mr_input(bx = ldlc, bxse = ldlcse, by = chdlodds, byse = chdloddsse),
  penalized = TRUE)
mr_egger(mr_input(calcium, calciumse, fastgluc, fastglucse, corr=calc.rho))
  ## correlated variants




