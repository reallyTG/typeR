library(compeir)


### Name: iprop
### Title: Event-specific incidence proportions
### Aliases: iprop

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

### Compute incidence proportions from irates object
iprop(ir)



