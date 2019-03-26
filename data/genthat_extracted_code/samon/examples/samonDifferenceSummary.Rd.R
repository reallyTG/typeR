library(samon)


### Name: samonDifferenceSummary
### Title: Summary function for the difference in treatment effect
### Aliases: samonDifferenceSummary

### ** Examples

# samon results for treatment 1 and 2 respectively:
data("P1Results")
data("P2Results")

Summary1 <- samonSummary( P1Results )
Summary2 <- samonSummary( P2Results )
SummaryD <- samonDifferenceSummary( Summary1, Summary2 )
SummaryX <- samonCrossSummary( Summary1, Summary2 )



