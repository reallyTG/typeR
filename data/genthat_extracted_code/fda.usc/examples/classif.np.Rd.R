library(fda.usc)


### Name: classif.np
### Title: Kernel Classifier from Functional Data
### Aliases: classif.np classif.kernel classif.knn
### Keywords: classif

### ** Examples

data(phoneme)
mlearn<-phoneme[["learn"]]
glearn<-phoneme[["classlearn"]]

h=9:19
out=classif.np(glearn,mlearn,h=h)
summary.classif(out)
#round(out$prob.group,4)



