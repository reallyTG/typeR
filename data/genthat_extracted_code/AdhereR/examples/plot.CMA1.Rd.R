library(AdhereR)


### Name: plot.CMA1
### Title: Plot CMA0-derived objects.
### Aliases: plot.CMA1 plot.CMA2 plot.CMA3 plot.CMA4 plot.CMA5 plot.CMA6
###   plot.CMA7 plot.CMA8 plot.CMA9

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
plot(cma1, patients.to.plot=c("1","2"));



