library(soundgen)


### Name: convert_sec_to_hms
### Title: Print time
### Aliases: convert_sec_to_hms
### Keywords: internal

### ** Examples

time_start = proc.time()
Sys.sleep(1)
time_diff = as.numeric((proc.time() - time_start)[3])
soundgen:::convert_sec_to_hms(time_diff)



