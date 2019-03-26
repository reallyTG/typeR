library(GCalcium)


### Name: between_trial_change
### Title: Compare mean activity between trials
### Aliases: between_trial_change

### ** Examples

# How much did the mean value change 2s after epoc between trials 1-5 and trials 6-10?
df.new <- format_data(data = GCaMP)
between_trial_change(Dataframe = df.new, TrialRange1 = c(1, 5),
TrialRange2 = c(6, 10), Time.period = c(0, 2))



