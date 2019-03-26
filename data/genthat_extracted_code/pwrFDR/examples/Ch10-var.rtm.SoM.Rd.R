library(pwrFDR)


### Name: var.rtm.SoM
### Title: Calculates asymptotic variance of true positive fraction,
###   S_m/M_m.
### Aliases: var.rtm.SoM
### Keywords: Benjamini-Hochberg Multiple.Testing average.power k.power
###   lambda.power

### ** Examples

  ## call using result of pwrFDR 
  rslt.Iz <- pwrFDR(effect.size=0.79, n.sample=46, r.1=2000/54675, FDR=0.15)
  vS <- var.rtm.SoM(rslt.Iz)

  ## call via argument list specification
  vS <- var.rtm.SoM(effect.size=0.79, n.sample=46, r.1=2000/54675, FDR=0.15)



