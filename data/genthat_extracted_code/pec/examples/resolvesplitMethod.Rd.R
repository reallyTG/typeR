library(pec)


### Name: resolvesplitMethod
### Title: Resolve the splitMethod for estimation of prediction performance
### Aliases: resolvesplitMethod
### Keywords: prediction

### ** Examples


  # BootstrapCrossValidation: Sampling with replacement   
  resolvesplitMethod("BootCv",N=10,B=10)

  # 10-fold cross-validation: repeated 2 times
  resolvesplitMethod("cv10",N=10,B=2)

  # leave-one-out cross-validation
  resolvesplitMethod("loocv",N=10)

  resolvesplitMethod("bootcv632plus",N=10,B=2)
  
  



