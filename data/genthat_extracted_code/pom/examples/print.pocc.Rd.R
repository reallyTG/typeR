library(pom)


### Name: print.pom
### Title: Printing Patch Occupancy Model Fits
### Aliases: print.pom
### Keywords: print

### ** Examples

data(weta.data) 
	
fit1 <- siteocc(~1, ~1, histories=weta.data$detection.histories) 
print(fit1)



