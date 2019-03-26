library(compeir)


### Name: irates.ratio
### Title: Ratio between two event-specific incidence rates
### Aliases: irates.ratio

### ** Examples

### Example data.frame with aggregated count data
dat <- data.frame(
			times = c(7948,2899), 
			no.event = c(6,8), 
			event.1 = c(589,68), 
			event.2 = c(55,21), 
			row.names = c("covar0","covar1"))  

### Compute irates object from dat
ir <- irates(dat)

### Compute incidence rate ratios from irates object
irates.ratio(
		ir, 
		covar.code = c("covar1", "covar0"))




