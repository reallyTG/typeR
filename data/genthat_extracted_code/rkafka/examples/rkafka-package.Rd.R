library(rkafka)


### Name: rkafka
### Title: Using Apache 'Kafka' Messaging Queue Through 'R'
### Aliases: rkafka
### Keywords: Apache Kafka

### ** Examples
## Not run: 
##D prod1=rkafka.createProducer("127.0.0.1:9092")
##D rkafka.send(prod1,"test","127.0.0.1:9092","Testing once")
##D rkafka.send(prod1,"test","127.0.0.1:9092","Testing twice")
##D rkafka.send(prod1,"test","127.0.0.1:9092","Testing thrice")
##D rkafka.closeProducer(prod1)
##D consumer1=rkafka.createConsumer("127.0.0.1:2181","test")
##D print(rkafka.read(consumer1))
##D print(rkafka.read(consumer1))
##D print(rkafka.read(consumer1))
## End(Not run)



