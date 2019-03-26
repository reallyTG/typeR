library(multiplex)


### Name: diagram
### Title: Plot the Hasse Diagram of a set of ordered relations
### Aliases: diagram
### Keywords: graphs

### ** Examples

## load the data
data("incubA")

## given e.g. a partial order table in the object 'po'
po <- partial.order(as.strings(incubA$IM), type="strings")


## plot the order relation as a Hasse diagram.
## Not run: 
##D if(require(Rgraphviz)) {
##D plot(diagram(po))
##D }
## End(Not run)



