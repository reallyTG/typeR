library(GCalcium)


### Name: moving_window
### Title: Summarize data within windows of time
### Aliases: moving_window

### ** Examples

### Format data frame
df.new <- format_data(GCaMP)

### In trial 5, how does the average fluorescence change in 1 second time frames?
moving_window(Dataframe = df.new, Trial = 5, Window.length = 1, FUN = mean)



