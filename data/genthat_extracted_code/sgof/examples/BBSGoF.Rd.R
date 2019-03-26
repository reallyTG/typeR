library(sgof)


### Name: BBSGoF
### Title: BBSGoF multiple testing procedure.
### Aliases: BBSGoF print.BBSGoF
### Keywords: htest correlation BBSGoF multi-testing

### ** Examples


p<-runif(387)^2  #387 independent p-values, non-uniform intersection null violated

res<-BBSGoF(p)
summary(res)    #automatic number of blocks, number of rejected nulls, 
		#estimated FDR, beta and beta-binomial parameters,
		#Tarone test of no correlation 

par(mfrow=c(2,2))
plot(res)   #Tarone test, within-block correlation, beta density (for automatic k),
	    #and decision plot (number of rejected nulls)





