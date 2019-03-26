library(micropan)


### Name: panTree
### Title: Constructing pan-genome trees
### Aliases: panTree

### ** Examples

# Loading a Panmat object, constructing a tree and plotting it 
data(list="Mpneumoniae.blast.panmat",package="micropan")
my.tree <- panTree(Mpneumoniae.blast.panmat)
plot(my.tree)

# Computing some weights to be used in the distManhattan
# function below...
w <- geneWeights(Mpneumoniae.blast.panmat,type="shell")
# Creating another tree with scaled and weighted distances and bootstrap values
my.tree <- panTree(Mpneumoniae.blast.panmat, scale=0.1, weights=w)

# ...and plotting with alternative labels and colors from Mpneumoniae.table
data(list="Mpneumoniae.table",package="micropan")
labels <- Mpneumoniae.table$Strain
names(labels) <- Mpneumoniae.table$GID.tag
cols <- Mpneumoniae.table$Color
names(cols) <- Mpneumoniae.table$GID.tag
plot(my.tree, leaf.lab=labels, col=cols,cex=0.8, xlab="Shell-weighted Manhattan distances")




