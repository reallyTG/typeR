library(runjags)


### Name: timestring
### Title: Calculate the Elapsed Time in Sensible Units
### Aliases: timestring
### Keywords: methods

### ** Examples


# time how long it takes to complete a task:

pre.time <- Sys.time()
Sys.sleep(2)  # PROCESS TO TIME
post.time <- Sys.time()
timestring(pre.time, post.time)

# Convert 4687 seconds into hours:

timestring(4687, units='hours', show.units=FALSE)




