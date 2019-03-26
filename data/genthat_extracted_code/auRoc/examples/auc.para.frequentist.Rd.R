library(auRoc)


### Name: auc.para.frequentist
### Title: AUC by Frequentist Parametric Methods
### Aliases: auc.para.frequentist
### Keywords: htest

### ** Examples


  #Example 1
  data(petBrainGlioma)
  y <- subset(petBrainGlioma, grade==1, select="FDG", drop=TRUE)
  x <- subset(petBrainGlioma, grade==2, select="FDG", drop=TRUE)
  auc.para.frequentist(x, y, dist="exp")

   
  #Example 2
  data(petBrainGlioma)
  y <- subset(petBrainGlioma, grade==1, select="ACE", drop=TRUE)
  x <- subset(petBrainGlioma, grade==2, select="ACE", drop=TRUE)
  auc.para.frequentist(x, y, method="RG1")
  





