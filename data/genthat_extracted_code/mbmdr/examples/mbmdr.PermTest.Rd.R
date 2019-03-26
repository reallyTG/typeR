library(mbmdr)


### Name: mbmdr.PermTest
### Title: Permutation Test for exploring significance of MB-MDR result.
### Aliases: mbmdr.PermTest print.mbmdr.PermTest

### ** Examples

  data(simSNP)
  fit <- mbmdr(y=simSNP$Y,data=simSNP[,3:12],order=2,list.models=c(2,1),
             family=binomial(link=logit))
             
  # Single model permutation test
  mbmdr.PermTest(fit,100)
  
  # Next steps takes some time
  
  # Permutation test for all models with MIN.P <= 0.05
  # order <- 2
  # models <- subset(fit$result, MIN.P <= 0.05, select = 1:order)
  # mbmdr.PermTest(fit,100,models)
  
  # Permutation test and confidence interval for all models with MIN.P <= 0.05 
  # mbmdr.PermTest(fit,100,models,sig.level=0.05)




