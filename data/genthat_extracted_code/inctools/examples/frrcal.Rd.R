library(inctools)


### Name: frrcal
### Title: Estimate False-Recent Rate
### Aliases: frrcal

### ** Examples

frrcal(data=excalibdata,
       subid_var = "SubjectID",
       time_var = "DaysSinceEDDI",
       recency_cutoff_time = 730.5,
       recency_rule = "independent_thresholds",
       recency_vars = c("Result","VL"),
       recency_params = c(10,0,1000,1),
       alpha = 0.05)



