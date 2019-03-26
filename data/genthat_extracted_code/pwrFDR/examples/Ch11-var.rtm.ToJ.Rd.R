library(pwrFDR)


### Name: var.rtm.ToJ
### Title: Calculates asymptotic variance of false discovery fraction,
###   T_N/J_N.
### Aliases: var.rtm.ToJ
### Keywords: Benjamini-Hochberg Multiple.Testing average.power k.power
###   lambda.power

### ** Examples

  ## call using result of pwrFDR 
  rslt.Iz <- pwrFDR(effect.size=0.79, n.sample=46, r.1=2000/54675, FDR=0.15)
  vJ <- var.J.o.rtm(rslt.Iz)

  ## call via argument list specification
  vJ <- var.J.o.rtm(effect.size=0.79, n.sample=46, r.1=2000/54675, FDR=0.15)



