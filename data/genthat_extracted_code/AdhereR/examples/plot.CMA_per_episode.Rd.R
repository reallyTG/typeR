library(AdhereR)


### Name: plot.CMA_per_episode
### Title: Plot CMA_per_episode and CMA_sliding_window objects.
### Aliases: plot.CMA_per_episode plot.CMA_sliding_window

### ** Examples

## Not run: 
##D cmaW <- CMA_sliding_window(CMA=CMA1,
##D                         data=med.events,
##D                         ID.colname="PATIENT_ID",
##D                         event.date.colname="DATE",
##D                         event.duration.colname="DURATION",
##D                         event.daily.dose.colname="PERDAY",
##D                         medication.class.colname="CATEGORY",
##D                         carry.only.for.same.medication=FALSE,
##D                         consider.dosage.change=FALSE,
##D                         followup.window.start=0,
##D                         observation.window.start=0,
##D                         observation.window.duration=365,
##D                         sliding.window.start=0,
##D                         sliding.window.start.unit="days",
##D                         sliding.window.duration=90,
##D                         sliding.window.duration.unit="days",
##D                         sliding.window.step.duration=7,
##D                         sliding.window.step.unit="days",
##D                         sliding.window.no.steps=NA,
##D                         date.format="%m/%d/%Y"
##D                        );
##D plot(cmaW, patients.to.plot=c("1","2"));
##D cmaE <- CMA_per_episode(CMA=CMA1,
##D                         data=med.events,
##D                         ID.colname="PATIENT_ID",
##D                         event.date.colname="DATE",
##D                         event.duration.colname="DURATION",
##D                         event.daily.dose.colname="PERDAY",
##D                         medication.class.colname="CATEGORY",
##D                         carry.only.for.same.medication=FALSE,
##D                         consider.dosage.change=FALSE,
##D                         followup.window.start=0,
##D                         observation.window.start=0,
##D                         observation.window.duration=365,
##D                         date.format="%m/%d/%Y"
##D                        );
##D plot(cmaE, patients.to.plot=c("1","2"));
## End(Not run)



