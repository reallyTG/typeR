library(FamEvent)


### Name: penci
### Title: Estimate the confidence intervals for the penetrances
### Aliases: penci
### Keywords: Penetrance confidence interval

### ** Examples

  
  # Family data simulated from population-based design using a Weibull baseline hazard 
  
  fam <- simfam(N.fam=300, design="pop+", variation="none", base.dist="Weibull", 
                base.parms=c(0.01,3), vbeta=c(-1.13, 2.35), agemin=20, allelefreq=0.02)
  
  # Penetrance model fit for simulated family data
  
  fit <- penmodel(parms=c(0.01, 3), vbeta=c(-1.13, 2.35), data=fam, 
                  design="pop+", base.dist="Weibull")
  
  # 95% confidence intervals for the penetrance at age 50 based on 1000 simulations
  
  penci(fit$coefficients, fit$varcov, age=50, base.dist="Weibull", agemin=20, n=1000)
  




