library(meltt)


### Name: meltt_inspect
### Title: Returns flagged event-to-episode matches for review.
### Aliases: meltt_inspect

### ** Examples

## No test: 
data(crashMD)
output <- meltt(crash_data1, crash_data2, crash_data3,
                taxonomies = crash_taxonomies, twindow = 1, spatwindow = 3)

flagged <- meltt_inspect(output)
flagged

retain <- c(TRUE,TRUE,TRUE,TRUE,TRUE)
dataset <- meltt_inspect(output, confirmed_matches = retain)
head(dataset)
## End(No test)



