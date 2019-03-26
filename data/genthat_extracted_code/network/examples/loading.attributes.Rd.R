library(network)


### Name: loading.attributes
### Title: Examples of how to load vertex and edge attributes into networks
### Aliases: loading.attributes
### Keywords: classes graphs

### ** Examples


# read in a relational data adjacency matrix

# LOADING IN A MATRIX
## Not run: 
##D # can download matrix file from 
##D # https://statnet.csde.washington.edu/trac/raw-attachment/wiki/Resources/relationalData.csv
##D # and download vertex attribute file from
##D # https://statnet.csde.washington.edu/trac/raw-attachment/wiki/Resources/vertexAttributes.csv
##D 
##D # load in relation matrix from file
##D relations <- read.csv("relationalData.csv",header=FALSE,stringsAsFactors=FALSE)
##D 
##D # convert to matrix format from data frame
##D relations <- as.matrix(relations) 
##D 
##D # load in vertex attributes
##D nodeInfo <- read.csv("vertexAttributes.csv",header=TRUE,stringsAsFactors=FALSE)
## End(Not run)
## Don't show: 
# since no access to file, creating it here
relations <- matrix(
                c(0,0,0,1,1,1,0,0,0,
                  0,0,0,0,0,1,0,0,0,
                  0,0,0,0,0,0,1,0,1,
                  1,0,0,0,1,0,0,0,0,
                  1,0,0,1,0,0,0,0,0,
                  1,1,0,0,0,0,0,0,1,
                  0,0,1,0,0,0,0,0,1,
                  0,0,0,0,0,0,0,0,0,
                  0,0,1,0,0,1,1,0,0),ncol=9,byrow=TRUE)
                  
nodeInfo <- data.frame(
    name=c("Danielle","Josh","Mark","Emma","Sarah","Dave","Theresa","Carolyn","Gil"),
    age=c(44,44,40,32,33,36,38,42,30),
    sex=c("F","M","M","F","F","M","F","F","M"),    
    handed=c("R","R","R","L","R","L","L","R","L"),
    lastDocVisit=c(2012,2008,2010,2012,2011,2007,2009,2009,2010),
    stringsAsFactors=FALSE
)
## End(Don't show)          
                  
print(relations) # peek at matrix 
print(nodeInfo)  # peek at attribute data

# Since our relational data has no row/column names, let's set them now
rownames(relations) <- nodeInfo$name
colnames(relations) <- nodeInfo$name

# create undirected network object from matrix
nrelations<-network(relations,directed=FALSE)

# it read in vertex names from matrix col names ...
network.vertex.names(nrelations)

# ATTACHING VERTEX ATTRIBUTES

# ... but could also set vertex.names with 
nrelations%v%'vertex.names'<- nodeInfo$name

# load in other attributes 
nrelations%v%"age" <- nodeInfo$age
nrelations%v%"sex" <- nodeInfo$sex
nrelations%v%"handed" <- nodeInfo$handed
nrelations%v%"lastDocVisit" <- nodeInfo$lastDocVisit

# Note: order of attributes in the data frame MUST match vertex ids
# otherwise the attribute will get assigned to the wrong vertex

# check that they got loaded
list.vertex.attributes(nrelations)


# what if we had an adjaceny  matrix like:
valuedMat<-matrix(c(1,2,3, 2,0,9.5,1,5,0),ncol=3,byrow=TRUE)
valuedMat

# make a network from it
valuedNet<-network(valuedMat,loops=TRUE,directed=TRUE)

# print it back out ...
as.matrix(valuedNet)

# wait, where did the values go!!?

# LOADING A MATRIX WITH VALUES

# to construct net from matrix with values:
valuedNet<-network(valuedMat,loops=TRUE,directed=TRUE,
            ignore.eval=FALSE,names.eval='myEdgeWeight')
            
# also have to specify the name of the attribute when converting to matrix
as.matrix(valuedNet,attrname='myEdgeWeight')

# ATTACHING EDGE ATTRIBUTES FROM A MATRIX

# maybe we have edge attributes of a different sort in another matrix like:
edgeAttrs<-matrix(c("B","Z","Q","W","A","E","L","P","A"),ncol=3,byrow=TRUE)
edgeAttrs

# we can still attach them
valuedNet<-set.edge.value(valuedNet,'someLetters',edgeAttrs)

# and extract them
as.matrix(valuedNet,attrname='someLetters')
valuedNet%e%'someLetters'

# but notice that some of the values didn't get used 
# the ("A"s are missing) because there were no corresponding edges (loops)
# for the attribute to be attached to


# ATTACHING EDGE ATTRIBUTES FROM A LIST

# it is also possible to attach edge attributes directly from a list
edgeCols<-c("red","green","blue","orange","pink","brown","gray")
valuedNet<-set.edge.attribute(valuedNet,"edgeColors",edgeCols)

# but this can be risky, because we may not know the ordering of the edges,
# (especially if some have been deleted).  Does "green" go with the edge from 
# 1 to 2, or from 3 to 1?

# Usually if the edge data is only availible in list form, it is safer to construct
# the network from an edgelist in the first place

# LOADING IN AN EDGELIST

# pretend we just loaded in this data.frame from a file
elData<-data.frame(
  from_id=c("1","2","3","1","3","1","2"),
  to_id=c("1", "1", "1", "2", "2", "3", "3"),
  myEdgeWeight=c(1, 2, 1, 2, 5, 3, 9.5),
  someLetters=c("B", "W", "L", "Z", "P", "Q", "E"),
  edgeCols=c("red","green","blue","orange","pink","brown","gray"),
  stringsAsFactors=FALSE
)

# peek at data
# each row corresponds to a relationship (edge) in the network
elData

# to make a network we just use the first two id columns
valuedNet2<-network(elData[,1:2],matrix.type='edgelist')

# print it out
as.matrix(valuedNet2)

# has right edges, but no values

# to include values (with names from the columns)

valuedNet2<-network(elData,matrix.type='edgelist',ignore.eval=FALSE)
list.edge.attributes(valuedNet2)
as.matrix(valuedNet2,attrname='someLetters')




