library(rkafka)


### Name: rkafka.closeSimpleConsumer
### Title: Closing KAKFA Simple consumer
### Aliases: rkafka.closeSimpleConsumer SimpleConsumer
### Keywords: ~kafka ~consumer ~simple ~close

### ** Examples

## Not run: 
##D consumer1=rkafka.createSimpleConsumer("172.25.1.78","9092","10000","100000","test")
##D rkafka.receiveFromSimpleConsumer(consumer1,"test","0","0","test-group")
##D print(rkafka.readFromSimpleConsumer(consumer1))
##D rkafka.closeSimpleConsumer(consumer1)
## End(Not run)



