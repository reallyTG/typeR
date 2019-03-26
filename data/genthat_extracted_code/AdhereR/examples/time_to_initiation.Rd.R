library(AdhereR)


### Name: time_to_initiation
### Title: Computation of initiation times.
### Aliases: time_to_initiation

### ** Examples

time_init <- time_to_initiation(presc.data = durcomp.prescribing,
                                disp.data = durcomp.dispensing,
                                ID.colname = "ID",
                                presc.start.colname = "DATE.PRESC",
                                disp.date.colname = "DATE.DISP",
                                medication.class.colnames = c("ATC.CODE", "FORM", "UNIT"),
                                date.format = "%Y-%m-%d",
                                suppress.warnings = FALSE,
                                return.data.table = TRUE);



