library(AdhereR)


### Name: CMA9
### Title: CMA9 constructor.
### Aliases: CMA9

### ** Examples

cma9 <- CMA9(data=med.events,
             ID.colname="PATIENT_ID",
             event.date.colname="DATE",
             event.duration.colname="DURATION",
             event.daily.dose.colname="PERDAY",
             medication.class.colname="CATEGORY",
             carry.only.for.same.medication=FALSE,
             consider.dosage.change=FALSE,
             followup.window.start=30,
             observation.window.start=30,
             observation.window.duration=365,
             date.format="%m/%d/%Y"
            );



