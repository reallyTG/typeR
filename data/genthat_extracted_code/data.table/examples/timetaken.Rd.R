library(data.table)


### Name: timetaken
### Title: Pretty print of time taken
### Aliases: timetaken
### Keywords: data

### ** Examples

started.at=proc.time()
Sys.sleep(1)
cat("Finished in",timetaken(started.at),"\n")



