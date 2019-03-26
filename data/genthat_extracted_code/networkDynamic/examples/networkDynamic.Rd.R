library(networkDynamic)


### Name: networkDynamic
### Title: Convert various forms of network timing information into
###   networkDynamic objects.
### Aliases: networkDynamic

### ** Examples


# construct network out of a list of panels of varying sizes
# omiting missing day 25
data(windsurferPanels)
dynBeach<-networkDynamic(network.list=beach[-25], vertex.pid="vertex.names",
                        onsets=c(1:24,26:31),termini=c(2:25,27:32))

# read in tsv files for vertex and edge spells and 
# construct network of McFarland classroom interaction data
# see ?cls33_10_16_96 for more info about this data set

# read vertex data
rawVerts<-read.table(paste(path.package('networkDynamic'),
   "/extdata/cls33_10_16_96_vertices.tsv",sep=''),header=TRUE)

# peek at column headings to find ids and times
names(rawVerts)

# read in interation (edge) data
rawEdges<-read.table(paste(path.package('networkDynamic'),
  "/extdata/cls33_10_16_96_edges.tsv",sep=''),header=TRUE)

# peek at column headings to find ids and times
names(rawEdges)


# construct network using vertex and edge timing information
cls33 <-networkDynamic(vertex.spells=rawVerts[,c(3,4,1)],
                       edge.spells=rawEdges[,c(3,4,1,2)])

# add in the unchanging vertex attribute data
set.vertex.attribute(cls33,"sex",as.vector(rawVerts$sex))
set.vertex.attribute(cls33,"role",as.vector(rawVerts$role))

 ## Not run: 
##D   # takes 5 seconds, too slow for CRAN checks
##D # loop over edge data to add the dynamic attributes on the edge
##D for(r in 1:nrow(rawEdges)){
##D   # get the id of the edge from its tail and head
##D   eid <- get.edgeIDs(cls33,v=rawEdges$from_vertex_id[r],
##D                      alter=rawEdges$to_vertex_id[r])
##D   activate.edge.attribute(cls33,'interaction_type',rawEdges$interaction_type[r],
##D           onset=rawEdges$start_minute[r],terminus=rawEdges$end_minute[r],e=eid)
##D   activate.edge.attribute(cls33,'weight',rawEdges$weight[r],
##D           onset=rawEdges$start_minute[r],terminus=rawEdges$end_minute[r],e=eid)
##D }
##D 
##D # convert the set of newcomb panels with rank weights
##D data(newcomb)
##D newRankDyn <-networkDynamic(network.list=newcomb.rank)
##D get.network.attribute.active(newRankDyn,'title',at=3)
##D as.matrix(network.collapse(newRankDyn,at=5),attrname='rank')
##D 
## End(Not run)





