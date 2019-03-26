library(jomo)


### Name: jomo1
### Title: JM Imputation of single level data
### Aliases: jomo1

### ** Examples


attach(sldata)

#We define all the inputs:

Y=data.frame(measure,age)
nburn=as.integer(200);
nbetween=as.integer(200);
nimp=as.integer(5);

# Then we run the function:

imp<-jomo1(Y,nburn=nburn,nbetween=nbetween,nimp=nimp)



