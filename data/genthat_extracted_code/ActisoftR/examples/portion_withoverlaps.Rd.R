library(ActisoftR)


### Name: portion_withoverlaps
### Title: Slices a data.frame containing date-time type columns including
###   overlaping periods.
### Aliases: portion_withoverlaps

### ** Examples

library("lubridate")
start.period <- ymd_hms("2017-12-10 12:00:00")
end.period <- ymd_hms("2017-12-12 12:00:00")
portion_withoverlaps(act[act$subject_ID==1,], from = start.period,  to = end.period)



