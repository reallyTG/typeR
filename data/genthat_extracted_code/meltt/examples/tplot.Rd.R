library(meltt)


### Name: tplot
### Title: Temporal distribution of meltt output data.
### Aliases: tplot

### ** Examples

## No test: 
data(crashMD)
output <- meltt(crash_data1, crash_data2, crash_data3,
                      taxonomies = crash_taxonomies, twindow = 1, spatwindow = 3)

# Free scale
tplot(output, time_unit = "days")

# Relative scale
tplot(output, time_unit = "days", free_scale = FALSE)
## End(No test)



