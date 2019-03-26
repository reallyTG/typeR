library(compeir)


### Name: CIFplot
### Title: Plotting estimates of the cumulative incidence function
### Aliases: CIFplot

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

### Compute the cumulative incidence function from irates object
### here: timespan is specified by xlim (default: xlim = c(0,30))
CIFplot(x = ir)


### sir.adm: Individual patient data
data(sir.adm)

### aggregate data
agg.sir.adm <- data.reshape(
			times = sir.adm$time, 
			events = sir.adm$status, 
			covar = sir.adm$pneu, 
			no.event.code= "0")

### Plot parametric and non-parametric CIF estimates
CIFplot(
	x = irates(agg.sir.adm), 
	indiv.times = sir.adm$time, 
	indiv.events = sir.adm$status, 
	indiv.covar = sir.adm$pneu)


### okiss: Individual patient data
### here: e.g. just event of interest 1 (infection) is plotted
data(okiss)

### aggregate data
agg.okiss <- data.reshape(
			times = okiss$time, 
			events = okiss$status, 
			covar = okiss$allo, 
			no.event.code= "11")

### Plot parametric and non-parametric CIF estimates
CIFplot(
	x = irates(agg.okiss), 
	event.code = "1",
	indiv.times = okiss$time, 
	indiv.events = okiss$status, 
	indiv.covar = okiss$allo)




