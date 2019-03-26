library(GCalcium)


### Name: within_trial_change
### Title: Get mean activity change within a trial
### Aliases: within_trial_change

### ** Examples

# In trial 1, how much did the mean value change between -2s and 0s, and 0 and 2s?
df.new <- format_data(data = GCaMP)
within_trial_change(Dataframe = df.new, Trial = 1, Beg.period = c(-2, 0), End.period = c(0, 2))



