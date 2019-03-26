library(sgof)


### Name: summary.BBSGoF
### Title: Summary of a BBSGoF object
### Aliases: summary.BBSGoF
### Keywords: htest correlation BBSGoF multi-testing

### ** Examples


p<-runif(387)^2  #387 p-values, intersection null violated

res<-BBSGoF(p)
summary(res)    #automatic number of blocks, number of rejected nulls, 
		#estimated FDR, beta and beta-binomial parameters,
		#Tarone test of no correlation 





