library(pastecs)


### Name: daystoyears
### Title: Convert time units from "days" to "years" or back
### Aliases: daystoyears yearstodays
### Keywords: ts

### ** Examples

# A vector with a "days" time-scale (25 values every 30 days)
A <- (1:25)*30
# Convert it to a "years" time-scale, using 23/05/2001 (d/m/Y) as first value
B <- daystoyears(A, datemin="23/05/2001", dateformat="d/m/Y")
B
# Convert it back to "days" time-scale
yearstodays(B, xmin=30)

# Here is an example showing the shift introduced, and its consequence:
C <- daystoyears(unclass(as.Date(c("1970-1-1","1971-1-1","1972-1-1","1973-1-1"),
	format = "%Y-%m-%d")))
C



