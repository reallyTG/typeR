library(pwrFDR)


### Name: var.J.o.rtm
### Title: Calculates asymptotic variance of significant call fraction,
###   J_m/m in the BH-FDR procedure on m=N.tests simultaneous tests.
### Aliases: var.J.o.rtm
### Keywords: Benjamini-Hochberg Multiple.Testing k.power lambda.power

### ** Examples

  ## call using result of pwrFDR 
  rslt.Iz <- pwrFDR(effect.size=0.79, n.sample=46, r.1=2000/54675, FDR=0.15)
  vJ <- var.J.o.rtm(rslt.Iz)

  ## call via argument list specification
  vJ <- var.J.o.rtm(effect.size=0.79, n.sample=46, r.1=2000/54675, FDR=0.15)



