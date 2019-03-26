library(networkDynamic)


### Name: activity.attribute
### Title: Activity Attributes for Dynamically Extended Networks
### Aliases: activity.attribute
### Keywords: ~kwd1 ~kwd2

### ** Examples

triangle <- network.initialize(3)  # create a toy network

activate.vertices(triangle,onset=1,terminus=5,v=1) 
activate.vertices(triangle,onset=1,terminus=10,v=2)
activate.vertices(triangle,onset=4,terminus=10,v=3)
deactivate.vertices(triangle,onset=2, length=2, v=1)

get.vertex.activity(triangle) # vertex spells



