library(dfConn)


### Name: data_summary_coverage
### Title: Obtain the non-zero coverage for both two conditions and the
###   condition-based difference
### Aliases: data_summary_coverage

### ** Examples

# Summarize the output of linear mixed effect model for dynamic functional connectivity
data(DynModel_results)
data_summary_coverage(DynModel_results$est_CI)
## Don't show: 
rm(list = c("DynModel_results"))
gc()
## End(Don't show)



