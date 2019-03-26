library(ClinReport)


### Name: spacetable
### Title: Add space to the results of a statistic table
### Aliases: spacetable

### ** Examples


data(data)
spacetable(report.quali(data=data,y="y_logistic",x1="GROUP",
x2="TIMEPOINT")$output,at.row="TIMEPOINT")





