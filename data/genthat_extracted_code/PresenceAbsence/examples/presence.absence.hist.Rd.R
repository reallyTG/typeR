library(PresenceAbsence)


### Name: presence.absence.hist
### Title: Presence/Absence Histogram
### Aliases: presence.absence.hist
### Keywords: models

### ** Examples

data(SIM3DATA)

### EXAMPLE 1 - Comparing three models ###
par(mfrow=c(1,3))
for(i in 1:3){
	presence.absence.hist(	SIM3DATA,
					which.model=i,
					na.rm=TRUE,
					model.names=c("Model 1","Model 2","Model 3"),
					N.bars=10,
					truncate.tallest=FALSE,
					opt.thresholds=TRUE,
					opt.methods=c("Default","Sens=Spec","MaxKappa"))}

### EXAMPLE 2 - Effect of 'truncate.tallest' argument ###
par(mfrow=c(1,2))
presence.absence.hist(	SIM3DATA,
				which.model=1,
				model.names=c("Model 1","Model 2","Model 3"),
				N.bars=10,
				truncate.tallest=FALSE,
				main="truncate.tallest=FALSE")
presence.absence.hist(	SIM3DATA,
				which.model=1,
				model.names=c("Model 1","Model 2","Model 3"),
				N.bars=10,
				truncate.tallest=TRUE,
				main="truncate.tallest=TRUE")



