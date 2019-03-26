library(ape)


### Name: rotate
### Title: Swapping Sister Clades
### Aliases: rotate rotateConstr
### Keywords: manip

### ** Examples

# create a random tree:
tre <- rtree(25)

# visualize labels of internal nodes:
plot(tre, use.edge.length=FALSE)
nodelabels()

# rotate clades around node 30:
tre.new <- rotate(tre, 30)

# compare the results:
par(mfrow=c(1,2)) # split graphical device
plot(tre) # plot old tre
plot(tre.new) # plot new tree

# visualize labels of terminal nodes:
plot(tre)
tiplabels()

# rotate clades containing nodes 12 and 20:
tre.new <- rotate(tre, c(12, 21))

# compare the results:
par(mfrow=c(1,2)) # split graphical device
plot(tre) # plot old tre
plot(tre.new) # plot new tree

# or you migth just specify tiplabel names:
tre.new <- rotate(tre, c("t3", "t14"))

# compare the results:
par(mfrow=c(1,2)) # devide graphical device
plot(tre) # plot old tre
plot(tre.new) # plot new tree

# a simple example for rotateConstr:
A <- read.tree(text = "((A,B),(C,D));")
B <- read.tree(text = "(((D,C),B),A);")
B <- rotateConstr(B, A$tip.label)
plot(A); plot(B, d = "l")

# something more interesting (from ?cophyloplot):
tr1 <- rtree(40)
## drop 20 randomly chosen tips:
tr2 <- drop.tip(tr1, sample(tr1$tip.label, size = 20))
## rotate the root and reorder the whole:
tr2 <- rotate(tr2, 21)
tr2 <- read.tree(text = write.tree(tr2))
X <- cbind(tr2$tip.label, tr2$tip.label) # association matrix
cophyloplot(tr1, tr2, assoc = X, space = 28)
## before reordering tr2 we have to find the constraint:
co <- tr2$tip.label[order(match(tr2$tip.label, tr1$tip.label))]
newtr2 <- rotateConstr(tr2, co)
cophyloplot(tr1, newtr2, assoc = X, space = 28)



