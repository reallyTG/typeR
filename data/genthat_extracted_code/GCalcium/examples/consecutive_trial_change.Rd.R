library(GCalcium)


### Name: consecutive_trial_change
### Title: Compare mean activity in consecutive trials
### Aliases: consecutive_trial_change

### ** Examples

### How much did the mean value change after epoc between consecutive trials in trials 1-10?
df.new <- format_data(data = GCaMP)
consecutive_trial_change(Dataframe = df.new, Trials = c(1, 10), Time.period = c(0, 4))



