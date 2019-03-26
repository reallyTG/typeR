library(jomo)


### Name: jomo2
### Title: JM Imputation of 2-level data
### Aliases: jomo2

### ** Examples


attach(tldata)


#now we run the imputation function. Note that we would typically use an higher 
#number of nburn  and nbetween iterations in real applications (at least 100)

imp<-jomo2(Y=data.frame(measure.a), Y2=data.frame(big.city), clus=city,nburn=20,nbetween=20,nimp=2)




