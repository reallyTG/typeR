library(fda.usc)


### Name: summary.classif
### Title: Summarizes information from kernel classification methods.
### Aliases: summary.classif print.classif
### Keywords: print

### ** Examples

data(phoneme)
mlearn<-phoneme[["learn"]]
glearn<-phoneme[["classlearn"]]
## Not run, time consuming
# out=classif.knn(glearn,mlearn,knn=c(3,5,7))
# summary.classif(out)
# out2=classif.kernel(glearn,mlearn,h=2^(0:5))
#summary.classif(out2)



