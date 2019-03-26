library(heatwaveR)


### Name: lolli_plot
### Title: Create a timeline of selected event metrics as 'lollipops'.
### Aliases: lolli_plot

### ** Examples

ts <- ts2clm(sst_WA, climatologyPeriod = c("1983-01-01", "2012-12-31"))
res <- detect_event(ts)

library(ggplot2)

# The default output
lolli_plot(res)




