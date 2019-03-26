library(AGread)


### Name: get_duration
### Title: Provide the run time of processing
### Aliases: get_duration

### ** Examples

timer <- proc.time()
Sys.sleep(2.2)
AGread:::message_update(16, dur = get_duration(timer))




