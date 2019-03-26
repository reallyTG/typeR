library(treecm)


### Name: treecm-package
### Title: Assessment of the position of the centre of mass of trees
### Aliases: treecm treecm-package
### Keywords: package

### ** Examples

data(stonePine1TreeData)
vectors  <- treeVectors(stonePine1TreeData)
CM       <- centreOfMass(vectors)
plot(vectors, 
   main = "Centre Of Mass", 
   col = "grey30", 
   txtcol = "grey30")
plot(CM)
summary(CM)



