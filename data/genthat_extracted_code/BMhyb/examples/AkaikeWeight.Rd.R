library(BMhyb)


### Name: AkaikeWeight
### Title: Akaike weight
### Aliases: AkaikeWeight

### ** Examples

	#simulate 4 AICc values for 4 models.
	AICc_Array<-rnorm(4, mean=10,sd=1)
	#calculate the delta AICc
	Delta.AICc.Array<-AICc_Array-min(AICc_Array)
	#calculate the Akaike weight
	AkaikeWeight(Delta.AICc.Array)
	


