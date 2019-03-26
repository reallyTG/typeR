library(dpcR)


### Name: dpcr_density
### Title: Calculate Density of Single dPCR Run
### Aliases: dpcr_density
### Keywords: dplot hplot

### ** Examples


# Calculate the average number of molecules per partition and show the area
# of the confidence interval (left plot) and the area within the 
# confidence interval
par(mfrow = c(1,2))
dpcr_density(k = 25, n = 55, average = TRUE, methods = "wilson", 
	     conf.level = 0.95)
dpcr_density(k = 25, n = 55, average = TRUE, methods = "wilson", 
	     conf.level = -0.95)
par(mfrow = c(1,1))

# By setting average to FALSE the total number of positive molecules is 
# calculated
dpcr_density(k = 25, n = 55, average = FALSE, methods = "wilson", 
	     conf.level = 0.95)




