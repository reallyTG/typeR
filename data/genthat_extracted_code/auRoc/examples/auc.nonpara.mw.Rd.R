library(auRoc)


### Name: auc.nonpara.mw
### Title: AUC Based on the Mann-Whitney Statistic
### Aliases: auc.nonpara.mw
### Keywords: htest

### ** Examples


  data(petBrainGlioma)
  y <- subset(petBrainGlioma, grade==1, select="FDG", drop=TRUE)
  x <- subset(petBrainGlioma, grade==2, select="FDG", drop=TRUE)
  auc.nonpara.mw(x, y)
  auc.nonpara.mw(x, y, method="delong")



