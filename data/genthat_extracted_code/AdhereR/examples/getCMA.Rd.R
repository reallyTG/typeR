library(AdhereR)


### Name: getCMA
### Title: Access the actual CMA estimate from a CMA object.
### Aliases: getCMA

### ** Examples

cma1 <- CMA1(data=med.events,
             ID.colname="PATIENT_ID",
             event.date.colname="DATE",
             event.duration.colname="DURATION",
             followup.window.start=30,
             observation.window.start=30,
             observation.window.duration=365,
             date.format="%m/%d/%Y"
            );
getCMA(cma1);
## Not run: 
##D cmaE <- CMA_per_episode(CMA="CMA1",
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
##D getCMA(cmaE);
## End(Not run)



