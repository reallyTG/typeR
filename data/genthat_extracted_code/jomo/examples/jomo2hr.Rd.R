library(jomo)


### Name: jomo2hr
### Title: JM Imputation of 2-level data assuming cluster-specific level-1
###   covariance matrices across level-2 unit
### Aliases: jomo2hr

### ** Examples


attach(tldata)


#now we run the imputation function. Note that we would typically use an higher 
#number of nburn and nbetween iterations in real applications (at least 100)

imp<-jomo2hr(Y.con=data.frame(measure.a), Y2.cat=data.frame(big.city),
               Y2.numcat=c(2), clus=city,nburn=20, nbetween=20, nimp=2)




