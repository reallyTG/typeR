library(PresenceAbsence)


### Name: presence.absence.accuracy
### Title: Accuracy Table for Presence/Absence Data
### Aliases: presence.absence.accuracy
### Keywords: models

### ** Examples


data(SIM3DATA)

### EXAMPLE 1 - multiple model predictions at one threshold###

presence.absence.accuracy(SIM3DATA)
presence.absence.accuracy(SIM3DATA,threshold=.4,st.dev=FALSE)
presence.absence.accuracy(SIM3DATA, which.model=c(1,3),st.dev=FALSE)

### EXAMPLE 2 - one model prediction at multiple thresholds ###

presence.absence.accuracy(SIM3DATA, threshold=c(.25,.5,.75), which.model=3)
presence.absence.accuracy(SIM3DATA, threshold=11, which.model=2)

### EXAMPLE 3 - multiple model predictions, each at it's own treshold ###

presence.absence.accuracy(SIM3DATA, threshold=c(.5,.5,.2), which.model=c(1,2,2))





