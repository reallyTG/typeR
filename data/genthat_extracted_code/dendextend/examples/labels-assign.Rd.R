library(dendextend)


### Name: labels<-
### Title: "label" assignment operator
### Aliases: labels<- labels<-.default labels<-.dendrogram labels.hclust
###   labels<-.hclust labels.phylo labels<-.phylo

### ** Examples

x <- 1:3 
labels(x)
labels(x) <- letters[1:3]
labels(x) # [1] "a" "b" "c"
x
# a b c 
# 1 2 3 


# get("labels<-")

################
# Example for using the assignment with dendrogram and hclust objects:
hc <- hclust(dist(USArrests[1:3,]), "ave")
dend <- as.dendrogram(hc)

labels(hc) # "Arizona" "Alabama" "Alaska" 
labels(hc)  <- letters[1:3]
labels(hc)# "a" "b" "c"
labels(dend) # "Arizona" "Alabama" "Alaska" 
labels(dend) <- letters[1:3]
labels(dend) # "a" "b" "c"
labels(dend) <- LETTERS[1:2] # will produce a warning
labels(dend) # "A" "B" "A"
labels(dend) <- LETTERS[4:6] # will replace the labels correctly 
# (the fact the tree had duplicate labels will not cause a problem)
labels(dend) # "D" "E" "F"



