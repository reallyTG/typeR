library(miWQS)


### Name: impute.Lubin
### Title: Lubin et al. 2004: Bootstrapping Imputation
### Aliases: impute.Lubin
### Keywords: imputation

### ** Examples

  ###Example 2: Simulation
  #Let's apply the Lubin approach to the example simulated dataset.
  #A seed of 202 is executed before each run for reproducibility
  data(simdata87)
  #Impute: 1 chemical
  #No Covariates
  set.seed( 202)
  results_Lubin <- impute.Lubin (  simdata87$X.bdl[ ,1],   simdata87$DL[1],  K = 5)
  str(results_Lubin)
  summary(results_Lubin$imputed_values)

  #1 Covariate
  set.seed( 202)
  sim.z1 <- impute.Lubin(simdata87$X.bdl[ ,1],   simdata87$DL[1],
               K = 5, Z = simdata87$Z.sim[ , 1])
  summary(sim.z1$imputed_values)

  #2 Covariates
  set.seed( 202)
  sim.z2<- impute.Lubin(simdata87$X.bdl[ ,1],   simdata87$DL[1],
            K = 5, Z = simdata87$Z.sim[ , -2])
  summary(sim.z2$imputed_values)
  summary(sim.z2$bootstrap_index)



