library(meltt)


### Name: mplot
### Title: Wrapper to generate an interactive spatial plot of meltt output
###   data via Leaflet.
### Aliases: mplot

### ** Examples

## No test: 
data(crashMD)
output <- meltt(crash_data1, crash_data2, crash_data3,
                taxonomies = crash_taxonomies, twindow = 1,spatwindow = 3)

mplot(output)
## End(No test)



