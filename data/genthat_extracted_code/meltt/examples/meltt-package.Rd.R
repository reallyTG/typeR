library(meltt)


### Name: meltt-package
### Title: meltt: Matching Event Data by Location, Time, and Type
### Aliases: meltt-package

### ** Examples

## No test: 
data(crashMD)
output <- meltt(crash_data1, crash_data2, crash_data3,
                taxonomies = crash_taxonomies, twindow = 1, spatwindow = 3)
summary(output)
plot(output)
tplot(output, time_unit = 'days')
## End(No test)



