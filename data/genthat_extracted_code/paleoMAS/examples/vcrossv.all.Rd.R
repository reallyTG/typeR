library(paleoMAS)


### Name: vcrossv.all
### Title: V-fold iterative cross-validation for discriminant analysis
### Aliases: vcrossv.all
### Keywords: models robust

### ** Examples

data(quexilper)
# Taking only a fraction of the data base so the model is not saturated
a<-quexilper[1:10,1:20]
a<-t(a)
#build a dummy factor assuming that the first 10 species belong to group1 and the send ten belong to group 2
b<-as.factor(rep(c("group1","group2"),each=10))
#apply the function
vcrossv.all(a,b,to=5,nsimulat=1,funct=lda,ntrials=20,plot=TRUE)



