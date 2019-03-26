library(meltt)


### Name: meltt
### Title: Matching Event Data by Location, Time and Type
### Aliases: meltt

### ** Examples

## No test: 
data(crashMD)
output <- meltt(crash_data1, crash_data2, crash_data3,
                taxonomies = crash_taxonomies, twindow = 1, spatwindow = 3)
summary(output)
plot(output)

# Extract De-duplicated events
dataset <- meltt_data(output)
head(dataset)
## End(No test)



