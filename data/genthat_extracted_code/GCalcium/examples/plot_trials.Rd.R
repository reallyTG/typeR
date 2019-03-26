library(GCalcium)


### Name: plot_trials
### Title: Plot specified trials
### Aliases: plot_trials

### ** Examples

### Format data frame
df.new <- format_data(GCaMP)

### Specify and plot trials
my.trials <- c(1, 2, 7, 8)
plot_trials(Dataframe = df.new, Trials = my.trials)



