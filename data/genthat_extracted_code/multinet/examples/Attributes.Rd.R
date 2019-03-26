library(multinet)


### Name: Network management: attributes
### Title: Managing attributes
### Aliases: 'Network management: attributes' add.attributes.ml
###   attributes.ml set.values.ml get.values.ml new.attributes.ml
###   list.attributes.ml

### ** Examples

net <- ml.aucs()
attributes.ml(net)
# actor attributes, of string type (default)
add.attributes.ml(net,c("name","surname"))
# a numeric attribute associated to the layers (not available in this version)
# add.attributes.ml(net,"num vertices",type="numeric",target="layer") 
# attributes for vertices on the facebook layer
add.attributes.ml(net,"username",type="string",target="vertex",layer="facebook")
# attributes for edges on the work layer
add.attributes.ml(net,"strength",type="numeric",target="edge",layer="work")
# listing the attributes
attributes.ml(net)
# attributes.ml(net,"layer") # not available in this version
attributes.ml(net,"vertex")
attributes.ml(net,"edge")
# setting some values for the newly created attributes
set.values.ml(net,"name",actors=c("U54","U139"),values=c("John","Johanna"))
e <- data.frame(
    c("U139","U139"),
    c("work","work"),
    c("U71","U97"),
    c("work","work"))
set.values.ml(net,"strength",edges=e,values=.47)
# getting the values back
get.values.ml(net,"name",actors=c("U139"))
get.values.ml(net,"strength",edges=e)
# setting attributes based on network properties: create a "degree"
# attribute and set its value to the degree of each actor
actors.ml(net) -> a
layers.ml(net) -> l
degree.ml(net,actors=a,layers=l,mode="all") -> d
add.attributes.ml(net,target="actor",type="numeric",attributes="degree")
set.values.ml(net,attribute="degree",actors=a,values=d)
get.values.ml(net,attribute="degree",actors="U54")
# select actors based on attribute values (e.g., with degree greater than 40)
get.values.ml(net,attribute="degree",actors=a) -> degrees
a[degrees>40]
# list all the attributes again
attributes.ml(net)



