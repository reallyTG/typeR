library(auRoc)


### Name: auc.para.bayes
### Title: AUC by the Bayesian MCMC
### Aliases: auc.para.bayes
### Keywords: htest

### ** Examples


  #Example 1
  data(petBrainGlioma)
  y <- subset(petBrainGlioma, grade==1, select="FDG", drop=TRUE)
  x <- subset(petBrainGlioma, grade==2, select="FDG", drop=TRUE)
  auc.para.bayes(x, y, dist="exp")

   
  #Example 2
  data(petBrainGlioma)
  y <- subset(petBrainGlioma, grade==1, select="ACE", drop=TRUE)
  x <- subset(petBrainGlioma, grade==2, select="ACE", drop=TRUE)
  auc.para.bayes(x, y, dist="normalDV")
  





