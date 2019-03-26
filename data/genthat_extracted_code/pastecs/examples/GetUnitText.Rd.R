library(pastecs)


### Name: GetUnitText
### Title: Format a nice time units for labels in graphs
### Aliases: GetUnitText
### Keywords: ts

### ** Examples

timeser <- ts(1:24, frequency=12)           # 12 observations per year
if (exists("is.R") && is.function(is.R) && is.R()) {  # We are in R
attr(timeser, "units") <- "years"           # time in years for 'ts' object
} else {                                              # We are in Splus
attr(attr(timeser, "tspar"), "units") <- "years" # Idem for Splus 'rts' object
}
GetUnitText(timeser)                        # formats unit (1/12 year=months)



