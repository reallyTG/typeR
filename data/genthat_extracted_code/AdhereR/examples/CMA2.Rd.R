library(AdhereR)


### Name: CMA2
### Title: CMA2 and CMA4 constructors.
### Aliases: CMA2 CMA4

### ** Examples

cma2 <- CMA2(data=med.events,
             ID.colname="PATIENT_ID",
             event.date.colname="DATE",
             event.duration.colname="DURATION",
             followup.window.start=30,
             observation.window.start=30,
             observation.window.duration=365,
             date.format="%m/%d/%Y"
            );
cma4 <- CMA4(data=med.events,
             ID.colname="PATIENT_ID",
             event.date.colname="DATE",
             event.duration.colname="DURATION",
             followup.window.start=30,
             observation.window.start=30,
             observation.window.duration=365,
             date.format="%m/%d/%Y"
            );



