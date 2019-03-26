library(pom)


### Name: print.mixed.pom
### Title: Printing Patch Occupancy Model Fits For a Beta-binomial Mixture
### Aliases: print.mixed.pom
### Keywords: print

### ** Examples

data(weta.data) 
	
fit1 <- siteocc(~1, ~1, histories=weta.data$detection.histories) 
print(fit1)



