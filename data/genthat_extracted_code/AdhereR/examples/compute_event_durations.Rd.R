library(AdhereR)


### Name: compute_event_durations
### Title: Computation of event durations.
### Aliases: compute_event_durations

### ** Examples

event_durations <- compute_event_durations(disp.data = durcomp.dispensing[1:3,],
                                           presc.data = durcomp.prescribing,
                                           hosp.data = durcomp.hospitalisation,
                                           ID.colname = "ID",
                                           presc.date.colname = "DATE.PRESC",
                                           disp.date.colname = "DATE.DISP",
                                           date.format = "%Y-%m-%d",
                                           medication.class.colnames = c("ATC.CODE",
                                           "UNIT", "FORM"),
                                           total.dose.colname = "TOTAL.DOSE",
                                           presc.daily.dose.colname = "DAILY.DOSE",
                                           presc.duration.colname = "PRESC.DURATION",
                                           visit.colname = "VISIT",
                                           force.init.presc = TRUE,
                                           force.presc.renew = TRUE,
                                           split.on.dosage.change = TRUE,
                                           trt.interruption = "continue",
                                           suppress.warnings = FALSE,
                                           return.data.table = TRUE);



