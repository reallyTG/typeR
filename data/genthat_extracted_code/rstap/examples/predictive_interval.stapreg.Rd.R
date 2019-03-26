library(rstap)


### Name: predictive_interval.stapreg
### Title: Predictive intervals
### Aliases: predictive_interval.stapreg predictive_interval
###   predictive_interval.ppd

### ** Examples

if (!exists("example_model")) example(example_model)

predictive_interval(example_model)
newdata <- data.frame(subj_ID = c(1,1), measure_ID = c(1,2),
                     centered_income = c(-1,-.7), sex = c(0,0),
                     centered_age = c(-1,-.7)) 
# newdata
predictive_interval(example_model, newsubjdata = newdata,
                    newdistdata = distdata,
                    newtimedata = timedata,
                    subject_ID = "subj_ID",
                    group_ID = "measure_ID")




