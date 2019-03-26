library(compeir)


### Name: data.reshape
### Title: Reshaping individual patient data
### Aliases: data.reshape
### Keywords: manip

### ** Examples

### Example data: 
### Pneumonia on admission in intenive care unit patients

data(sir.adm)

data.reshape(
		times = sir.adm$time, 
		events = sir.adm$status, 
		covar = sir.adm$pneu, 
		no.event.code = "0")

### Example data: 
### Bloodstream infections in stem-cell transplanted patients

data(okiss)

data.reshape(
		times = okiss$time, 
		events = okiss$status, 
		covar = okiss$allo, 
		no.event.code = "11")



