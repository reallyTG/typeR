library(alineR)


### Name: features.plot
### Title: Plot feature optimization result
### Aliases: features.plot
### Keywords: ~kwd1 ~kwd2

### ** Examples

data<-data.frame(dog=c('dog','perro'),cat=c('cat','gato'),rat=c('rat','rata'))
M1<-generate.training(raw.data=data,search.size=100,table=FALSE)
M2<-optimize.features(set=M1,ranking=c(1,1,1),
                     num=20,step=5,replication=2,list=TRUE)
features.plot(M2)



