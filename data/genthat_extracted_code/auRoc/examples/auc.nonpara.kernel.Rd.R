library(auRoc)


### Name: auc.nonpara.kernel
### Title: AUC by Kernel Methods
### Aliases: auc.nonpara.kernel
### Keywords: htest

### ** Examples


  #Example 1
  data(petBrainGlioma)
  y <- subset(petBrainGlioma, grade==1, select="FDG", drop=TRUE)
  x <- subset(petBrainGlioma, grade==2, select="FDG", drop=TRUE)
  auc.nonpara.kernel(x, y)

   
  ## Not run: 
##D   #Example 2
##D   data(petBrainGlioma)
##D   y <- subset(petBrainGlioma, grade==1, select="ACE", drop=TRUE)
##D   x <- subset(petBrainGlioma, grade==2, select="ACE", drop=TRUE)
##D   auc.nonpara.kernel(x, y, integration="TRUE",
##D                      bw="sj",  method="bootstrapBCa", nboot=999)
##D   
## End(Not run)





