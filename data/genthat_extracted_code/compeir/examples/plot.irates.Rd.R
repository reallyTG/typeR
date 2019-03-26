library(compeir)


### Name: plot.irates
### Title: Comprehensive multi-state graphic for competing risks incidence
###   rates analysis
### Aliases: plot.irates
### Keywords: hplot

### ** Examples

#########################
### Pneumonia on admission data: sir.adm
data(sir.adm)
agg.sir <- data.reshape(
			times = sir.adm$time, 
			events = sir.adm$status, 
			covar = sir.adm$pneu, 
			no.event.code = "0")

### Compute irates object from dat
ir1 <- irates(agg.sir)

### Plot multistate-type graphic from irates object
plot(ir1)

#########################
### Compute irates object with certain labels
ir2 <- irates(
		agg.sir, 
		no.event.lab = "Admission", 
		event.lab = c("Discharge","Death"), 
		covar.lab = c("No pneumonia","Pneumonia"))

### Plot multistate-type graphic from irates object
plot(ir2)

#########################
### ONKO-KISS data: okiss
data(okiss)
### Aggregate individual patient data
agg.okiss <- data.reshape(
			times = okiss$time, 
			events = okiss$status, 
			covar = okiss$allo, 
			no.event.code = "11")

### Plot multistate-type graphic from irates object
plot(irates(agg.okiss, 
			no.event.lab = "Neutropenia", 
			event.lab = c("Infection","End of\n Neutropenia","Death"), 
			covar.lab = c("Autologous","Allogenic")
			),
	viewport.size = list(w = 4.5, h = 2.5)
	)



