library(compeir)


### Name: irates
### Title: Competing events incidence rates
### Aliases: irates
### Keywords: math

### ** Examples

### With individual patient data - sir.adm - using the function data.reshape
data(sir.adm)
dat1 <- data.reshape(
			times = sir.adm$time, 
			events = sir.adm$status, 
			covar = sir.adm$pneu, 
			no.event.code = "0")

### With aggregated count data
dat2 <- data.frame(
			time = c(7948,2899), 
			no.event = c(6,8), 
			event.1 = c(589,68), 
			event.2 = c(55,21), 
			row.names = c("covar0","covar1"))  

### Compute incidence rates from dat1 or dat2 (here dat2)
irates(dat2)

### Specify columns with time and no.event information
irates(
	dat2, 
	time.code = "time", 
	no.event.code = "no.event")

### Set specific labels
irates(
	dat2, 
	no.event.lab = "Admission", 
	event.lab = c("Discharge","Death"), 
	covar.lab = c("No pneumonia","Pneumonia"))



