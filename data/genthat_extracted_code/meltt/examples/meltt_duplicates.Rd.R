library(meltt)


### Name: meltt_duplicates
### Title: Return identified duplicate entries removed after integration.
### Aliases: meltt_duplicates

### ** Examples

## No test: 
data(crashMD)
output <- meltt(crash_data1, crash_data2, crash_data3,
                taxonomies = crash_taxonomies, twindow = 1, spatwindow = 3)
duplicates <- meltt_duplicates(output, column = c("date", "longitude", "latitude"))
head(duplicates)
## End(No test)



