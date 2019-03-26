library(GCalcium)


### Name: averaged_trials
### Title: Averages signals across trials
### Aliases: averaged_trials

### ** Examples

### Format data frame
df.new <- format_data(GCaMP)

### Plot the average fluorescence signal across trials 1-5
df.1thru5 <- averaged_trials(df.new, 1:5)

plot(x = df.1thru5$Time, df.1thru5$Values)



