library(meltt)


### Name: meltt_data
### Title: Returns de-duplicated entries from meltt output.
### Aliases: meltt_data

### ** Examples

## No test: 
data(crashMD)
output <- meltt(crash_data1, crash_data2, crash_data3,
                taxonomies = crash_taxonomies, twindow = 1, spatwindow = 3)
dataset <- meltt_data(output, column = c("date", "longitude", "latitude"))
head(dataset)

# Return all original columns
dataset <- meltt_data(output, return_all = TRUE)
## End(No test)



