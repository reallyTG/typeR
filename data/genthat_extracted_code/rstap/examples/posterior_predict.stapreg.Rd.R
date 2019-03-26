library(rstap)


### Name: posterior_predict.stapreg
### Title: Draw from posterior predictive distribution
### Aliases: posterior_predict.stapreg posterior_predict

### ** Examples

if (!exists("example_model")) example(example_model)
yrep <- posterior_predict(example_model)
table(yrep)

## No test: 
 
# If using new data the all pertinent data must be submitted to the function including subject_ID
# The same distance and time datasets below are used in the original function
# Which will associate the same spatio-temporal exposure to this subject's new fixed covariates.
newdata <- data.frame(subj_ID = 1, measure_ID = 1, centered_income = 0, sex = 0, centered_age = 0) 
pps <- posterior_predict(example_model, newsubjdata = newdata,
                         newdistdata= subset(distdata,subj_ID == 1, measure_ID == 1),
                         newtimedata = subset(timedata, subj_ID == 1, measure_ID == 1),
                         subject_ID = "subj_ID", group_ID = "measure_ID" )
## End(No test)



