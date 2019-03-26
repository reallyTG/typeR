library(rkafka)


### Name: rkafka.createProducer
### Title: Creating KAFKA producer
### Aliases: rkafka.createProducer metadataBrokerList producerType
###   compressionCodec serializerClass partitionerClass compressedTopics
###   queueBufferingMaxTime queueBufferingMaxMessages
###   queueEnqueueTimeoutTime batchNumMessages
### Keywords: ~KAFKA ~producer

### ** Examples

## Not run: 
##D producer1=rkafka.createProducer("127.0.0.1:9092")
##D producer2=rkafka.createProducer("127.0.0.1:9092","sync","none","kafka.serializer.StringEncoder")
## End(Not run)
  


