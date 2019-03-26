library(paleoMAS)


### Name: vcrossv.da
### Title: V-fold cross-validation for discriminant analysis
### Aliases: vcrossv.da
### Keywords: models robust

### ** Examples

data(quexilper)
# Taking only a fraction of the data base so the model is not saturated
a<-quexilper[1:10,1:20]
a<-t(a)
# build a dummy factor assuming that the first 10 species belong
# to group1 and the send ten belong to group 2
b<-as.factor(rep(c("group1","group2"),each=10))
#to apply ordinary crossvalidation (leave-one-out)
vcrossv.da(a,b,fold=1,nsimulat=1,funct=lda)
#to apply 3-fold cross-validation
vcrossv.da(a,b,fold=3,nsimulat=1,funct=lda)



