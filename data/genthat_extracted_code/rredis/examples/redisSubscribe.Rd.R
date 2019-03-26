library(rredis)


### Name: redisSubscribe
### Title: redisSubscribe
### Aliases: redisSubscribe

### ** Examples

## Not run: 
##D redisConnect()
##D # Define a callback function to process messages from channel 1:
##D channel1 <- function(x) {
##D   cat("Message received from channel 1: ",x,"\n")
##D }
##D # Define a callback function to process messages from channel 2:
##D channel2 <- function(x) {
##D   cat("Message received from channel 2: ",x,"\n")
##D }
##D redisSubscribe(c('channel1','channel2'))
##D # Monitor channels for at least 1 minute:
##D t1 <- proc.time()[[3]]
##D while(proc.time()[[3]] - t1 < 60)
##D {
##D   redisMonitorChannels()
##D   Sys.sleep(0.05)
##D }
##D redisUnsubscribe(c('channel1','channel2'))
## End(Not run)



