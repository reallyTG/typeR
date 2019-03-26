library(BMhyb)


### Name: ContourFromAdaptiveSampling
### Title: Contour maps
### Aliases: ContourFromAdaptiveSampling

### ** Examples

	#simulate a data frame for two parameters
	sims<-matrix(rnorm(300),ncol=3)
	sims<-as.data.frame(sims)
	colnames(sims)<-c("neglnL","param1","param2")
	#plot the contour map for the parameters
	ContourFromAdaptiveSampling(sims, params.of.interest=NULL)
	


