library(AdhereR)


### Name: CMA_sliding_window
### Title: CMA_sliding_window constructor.
### Aliases: CMA_sliding_window

### ** Examples

## Not run: 
##D cmaW <- CMA_sliding_window(CMA="CMA1",
##D                            data=med.events,
##D                            ID.colname="PATIENT_ID",
##D                            event.date.colname="DATE",
##D                            event.duration.colname="DURATION",
##D                            event.daily.dose.colname="PERDAY",
##D                            medication.class.colname="CATEGORY",
##D                            carry.only.for.same.medication=FALSE,
##D                            consider.dosage.change=FALSE,
##D                            followup.window.start=0,
##D                            observation.window.start=0,
##D                            observation.window.duration=365,
##D                            sliding.window.start=0,
##D                            sliding.window.start.unit="days",
##D                            sliding.window.duration=90,
##D                            sliding.window.duration.unit="days",
##D                            sliding.window.step.duration=7,
##D                            sliding.window.step.unit="days",
##D                            sliding.window.no.steps=NA,
##D                            date.format="%m/%d/%Y"
##D                           );
## End(Not run)



