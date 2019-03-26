library(dynamicGraph)


### Name: dg.Block-class
### Title: Class dg.Block
### Aliases: dg.Block-class closed<-,dg.Block-method closed,dg.Block-method
###   draw,dg.Block-method index<-,dg.Block-method index,dg.Block-method
###   initialize,dg.Block-method name,dg.Block-method
###   position<-,dg.Block-method position,dg.Block-method
###   stratum<-,dg.Block-method stratum,dg.Block-method
###   visible<-,dg.Block-method visible,dg.Block-method
###   parent<-,dg.Block-method parent,dg.Block-method
###   children<-,dg.Block-method children,dg.Block-method
###   ancestors<-,dg.Block-method ancestors,dg.Block-method
###   descendants<-,dg.Block-method descendants,dg.Block-method newBlock
###   dg.Block closed closed<- parent<- parent children<- children
###   ancestors ancestors<- descendants descendants<-
### Keywords: classes

### ** Examples


b <- new("dg.Block")

str(b)

color(b)
label(b)
labelPosition(b)
name(b)
index(b)
position(b)
stratum(b)
ancestors(b)
descendants(b)
visible(b)

color(b) <- "grey"
label(b) <- "NameAndLabel"
labelPosition(b) <- c(1, 2, 3)
# name(b) <- "NameAndLabel" # Not possible!!!
index(b) <- 3
position(b) <- matrix(c( 10,  20,  30,  40, 
                        110, 120, 130, 140), byrow = TRUE, ncol = 4)
stratum(b) <- 1
ancestors(b) <- c(1, 2)
descendants(b) <- c(4, 5)
visible(b) <- FALSE

str(b)



