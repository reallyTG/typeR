library(sgof)


### Name: plot.BBSGoF
### Title: Plot of a BBSGoF object.
### Aliases: plot.BBSGoF
### Keywords: htest correlation BBSGoF multi-testing

### ** Examples


p<-runif(387)^2  #387 independent p-values, non-uniform intersection null violated

res<-BBSGoF(p)
	
par(mfrow=c(2,2))
plot(res)   #Tarone test, within-block correlation, beta density (for automatic k),
	        #and decision plot (number of rejected nulls)




