library(rkafka)


### Name: rkafka.receiveFromSimpleConsumer
### Title: KAKFA Simple Consumer receiving messages
### Aliases: rkafka.receiveFromSimpleConsumer partition Offset msgReadSize
### Keywords: ~kafka ~simple ~consumer

### ** Examples

## Not run: 
##D consumer1=rkafka.createSimpleConsumer("172.25.1.78","9092","10000","100000","test")
##D rkafka.receiveFromSimpleConsumer(consumer1,"test","0","0","test-group")
## End(Not run)



