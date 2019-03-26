library(cheddar)


### Name: ResourcesByNode
### Title: Resources and consumers of nodes
### Aliases: ResourcesByNode ConsumersByNode ResourcesOfNodes
###   ConsumersOfNodes ResourcesAndConsumersByNode TrophicLinksForNodes
### Keywords: utilities

### ** Examples

data(TL84)

# A list containing a vector of resources for each node.
ResourcesByNode(TL84)

# A vector of resources of 'Umbra limi'
ResourcesOfNodes(TL84, 'Umbra limi')

# A vector of resources of 'Umbra limi'
ResourcesOfNodes(TL84, 56)

# A list containing vectors of resources for nodes 50:56
ResourcesOfNodes(TL84, 50:56)

# A data.frame containin columns resource and consumer
TrophicLinksForNodes(TL84, 'Umbra limi')

# A data.frame containin columns resource, consumer, resource.M and consumer.M
TrophicLinksForNodes(TL84, 'Umbra limi', node.properties='M')



