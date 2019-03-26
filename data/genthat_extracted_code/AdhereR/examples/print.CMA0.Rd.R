library(AdhereR)


### Name: print.CMA0
### Title: Print CMA0 (and derived) objects.
### Aliases: print.CMA0 print.CMA1 print.CMA2 print.CMA3 print.CMA4
###   print.CMA5 print.CMA6 print.CMA7 print.CMA8 print.CMA9
###   print.CMA_per_episode print.CMA_sliding_window

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
cma0;
print(cma0, format="markdown");
cma1 <- CMA1(data=med.events,
             ID.colname="PATIENT_ID",
             event.date.colname="DATE",
             event.duration.colname="DURATION",
             followup.window.start=30,
             observation.window.start=30,
             observation.window.duration=365,
             date.format="%m/%d/%Y"
            );
cma1;



