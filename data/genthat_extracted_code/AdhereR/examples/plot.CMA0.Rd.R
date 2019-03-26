library(AdhereR)


### Name: plot.CMA0
### Title: Plot CMA0 objects.
### Aliases: plot.CMA0

### ** Examples

cma0 <- CMA0(data=med.events,
             ID.colname="PATIENT_ID",
             event.date.colname="DATE",
             event.duration.colname="DURATION",
             event.daily.dose.colname="PERDAY",
             medication.class.colname="CATEGORY",
             followup.window.start=0,
             followup.window.start.unit="days",
             followup.window.duration=2*365,
             followup.window.duration.unit="days",
             observation.window.start=30,
             observation.window.start.unit="days",
             observation.window.duration=365,
             observation.window.duration.unit="days",
             date.format="%m/%d/%Y",
             summary="Base CMA");
plot(cma0, patients.to.plot=c("1","2"));



