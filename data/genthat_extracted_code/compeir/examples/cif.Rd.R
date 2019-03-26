library(compeir)


### Name: cif
### Title: Parametrically estimating the cumulative incidence function
### Aliases: cif

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

### Compute the cumulative incidence function from irates object, e.g.
cif(irates = ir, t = 1:10)




