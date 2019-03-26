library(rkafka)


### Name: rkafka.createConsumer
### Title: Creating KAFKA consumer
### Aliases: rkafka.createConsumer zookeeperConnect groupId
###   zookeeperConnectionTimeoutMs consumerTimeoutMs autoCommitEnable
###   autoCommitInterval autoOffsetReset
### Keywords: ~kafka ~consumer

### ** Examples

## Not run: 
##D consumer1=rkafka.createConsumer("127.0.0.1:2181","test123")
##D consumer2=rkafka.createConsumer("127.0.0.1:2181","test123","test-consumer-group","50000","1000")
## End(Not run)



