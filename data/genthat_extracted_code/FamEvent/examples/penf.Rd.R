library(FamEvent)


### Name: penf
### Title: Penetrance function
### Aliases: penf
### Keywords: Penetrance function

### ** Examples

  
  # Family data simulated from population-based design using a Weibull baseline hazard 
  
  fam <- simfam(N.fam=300, design="pop+", variation="none", base.dist="Weibull", 
                base.parms=c(0.01,3), vbeta=c(-1.13, 2.35), agemin=20, allelefreq=0.02)
  
  # Penetrance model fit for simulated family data
  
  fit <- penmodel(parms=c(0.01, 3), vbeta=c(-1.13, 2.35), data=fam, 
                  design="pop+", base.dist="Weibull")
  
  # Computing the penetrance at age 50 for male (sex=1) carriers (mut=1) from the assumed 
  # penetrance model based on Weibull baseline hazard.
  
  penf(fit$coefficients, age=50, sex=1, mut=1, base.dist="Weibull", agemin=20)
  
  



