library(dynamicGraph)


### Name: dg.Vertex-class
### Title: Class dg.Vertex
### Aliases: dg.Vertex-class ancestors<-,dg.Vertex-method
###   ancestors,dg.Vertex-method blockindex<-,dg.Vertex-method
###   blockindex,dg.Vertex-method descendants<-,dg.Vertex-method
###   descendants,dg.Vertex-method index<-,dg.Vertex-method
###   index,dg.Vertex-method initialize,dg.Vertex-method
###   name<-,dg.Vertex-method name,dg.Vertex-method
###   position<-,dg.Vertex-method position,dg.Vertex-method
###   stratum<-,dg.Vertex-method stratum,dg.Vertex-method
###   visible<-,dg.Vertex-method visible,dg.Vertex-method
###   constrained<-,dg.Vertex-method constrained,dg.Vertex-method newVertex
###   dg.Node dg.Vertex newVertex draw color color<- labelPosition
###   labelPosition<- name name<- index index<- position position<- stratum
###   stratum<- blockindex blockindex<- visible visible<- constrained
###   constrained<- addToPopups propertyDialog
### Keywords: classes

### ** Examples

a <- new("dg.DiscreteVertex", name = "a", label = "A", 
         index = 1, position = c(0, 0, 0))

str(a)

color(a)
label(a)
labelPosition(a)
name(a)
index(a)
position(a)
stratum(a)

color(a) <- "red"
label(a) <- "A vertex"
labelPosition(a) <- c(1, 2, 3)
name(a) <- "Capital.A"
index(a) <- -1
position(a) <- c(10, 20, 30)
stratum(a) <- 1

str(a)



