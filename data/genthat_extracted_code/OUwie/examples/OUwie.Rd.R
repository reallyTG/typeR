library(OUwie)


### Name: OUwie
### Title: Generalized Hansen models
### Aliases: OUwie
### Keywords: models

### ** Examples

data(tworegime)

#Plot the tree and the internal nodes to highlight the selective regimes:
select.reg<-character(length(tree$node.label)) 
select.reg[tree$node.label == 1] <- "black"
select.reg[tree$node.label == 2] <- "red"
plot(tree) 
nodelabels(pch=21, bg=select.reg)

#Not run
#To see the first 5 lines of the data matrix to see what how to
#structure the data:
#trait[1:5,]

#Now fit an OU model that allows different sigma^2: 
#OUwie(tree,trait,model=c("OUMV"),root.station=TRUE)

#Fit an OU model based on a clade of interest:
#OUwie(tree,trait,model=c("OUMV"), root.station=TRUE, clade=c("t50", "t64"))




