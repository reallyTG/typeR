library(rkafka)


### Name: rkafka.readFromSimpleConsumer
### Title: KAFKA Simple Consumer Reading
### Aliases: rkafka.readFromSimpleConsumer SimpleConsumerObj
### Keywords: ~kafka ~simple ~consumer ~read

### ** Examples

## Not run: 
##D consumer1=rkafka.createSimpleConsumer("172.25.1.78","9092","10000","100000","test")
##D rkafka.receiveFromSimpleConsumer(consumer1,"test","0","0","test-group")
##D print(rkafka.readFromSimpleConsumer(consumer1))
## End(Not run)



