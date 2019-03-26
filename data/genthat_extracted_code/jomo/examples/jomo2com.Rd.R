library(jomo)


### Name: jomo2com
### Title: JM Imputation of 2-level data assuming a common level-1
###   covariance matrix across level-2 units.
### Aliases: jomo2com

### ** Examples


attach(tldata)


#now we run the imputation function. Note that we would typically use an higher 
#number of nburn and nbetween iterations in real applications (at least 100)

imp<-jomo2com(Y.con=data.frame(measure.a), Y2.cat=data.frame(big.city),
                  Y2.numcat=c(2), clus=city,nburn=10,nbetween=10,nimp=3)



