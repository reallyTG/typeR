library(textmining)


### Name: topic_network
### Title: Function to plot topic network
### Aliases: topic_network

### ** Examples

## Not run: 
##D x <- tmCorpus(rep("as, a , a ,s  l k l l k k j h g f f hg j aaa", 100))
##D require(rJava)
##D model <- suppressMessages(train(x))
##D table_topic <- topic_table(model)
##D network <- topic_network(10 ,table_topic$words)
## End(Not run)



