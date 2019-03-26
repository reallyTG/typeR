library(itsadug)


### Name: report_stats
### Title: Returns a description of the statistics of the smooth terms for
###   reporting.
### Aliases: report_stats

### ** Examples

data(simdat)

# model without random effects:
m1 <- bam(Y ~ te(Time, Trial), data=simdat)
report_stats(m1)
# save report for later use:
report <- report_stats(m1, print.summary=FALSE)
report[3,2]




