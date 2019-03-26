library(samon)


### Name: samonDifferenceSummaryIM
### Title: Summary function for the difference in treatment
### Aliases: samonDifferenceSummaryIM

### ** Examples

# V1Results and V2Results are the returned objects from the
# samonIM function associated with VAS treatment 1 and 2 respectively.
data("V1Results")
data("V2Results")

# summarize each arm, their difference and their cross difference.
VSummary1 <- samonSummaryIM(V1Results)
VSummary2 <- samonSummaryIM(V2Results)
VSummaryD <- samonDifferenceSummaryIM(VSummary1,VSummary2)
VSummaryX <- samonCrossSummaryIM(VSummary1,VSummary2)



