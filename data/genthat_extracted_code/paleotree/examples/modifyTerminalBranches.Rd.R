library(paleotree)


### Name: modifyTerminalBranches
### Title: Modify, Drop or Bind Terminal Branches of Various Types (Mainly
###   for Paleontological Phylogenies)
### Aliases: modifyTerminalBranches dropZLB dropExtinct dropExtant
###   addTermBranchLength fixRootTime dropExtinct dropExtant
###   addTermBranchLength fixRootTime dropPaleoTip bindPaleoTip

### ** Examples


set.seed(444)
#Simulate some fossil ranges with simFossilRecord
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
#simulate a fossil record with imperfect sampling with sampleRanges
rangesCont <- sampleRanges(taxa,r = 0.5)
#Now let's make a tree using taxa2phylo
tree <- taxa2phylo(taxa,obs_time = rangesCont[,2])
#compare the two trees
layout(1:2)
plot(ladderize(tree))
plot(ladderize(dropZLB(tree)))
layout(1)

#example using dropExtinct and dropExtant
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = c(10,20))
taxa <- fossilRecord2fossilTaxa(record)
tree <- taxa2phylo(taxa)
phyloDiv(tree)
tree1 <- dropExtinct(tree)
phyloDiv(tree1)
tree2 <- dropExtant(tree)
phyloDiv(tree2)

#graphics.off()

#example using addTermBranchLength
set.seed(444)
treeA <- rtree(10)
treeB <- addTermBranchLength(treeA,1)
compareTermBranches(treeA,treeB)

#########################
#test dropPaleoTip
	#(and fixRootTime by extension...)

#simple example
tree <- read.tree(text = "(A:3,(B:2,(C:5,D:3):2):3);")
tree$root.time <- 10
plot(tree,no.margin = FALSE)
axisPhylo()

# now a series of tests, dropping various tips
(test <- dropPaleoTip(tree,"A")$root.time) #  = 7
(test[2] <- dropPaleoTip(tree,"B")$root.time) #  = 10
(test[3] <- dropPaleoTip(tree,"C")$root.time) #  = 10
(test[4] <- dropPaleoTip(tree,"D")$root.time) #  = 10
(test[5] <- dropPaleoTip(tree,c("A","B"))$root.time) #  = 5
(test[6] <- dropPaleoTip(tree,c("B","C"))$root.time) #  = 10
(test[7] <- dropPaleoTip(tree,c("A","C"))$root.time) #  = 7
(test[8] <- dropPaleoTip(tree,c("A","D"))$root.time) #  = 7

# is it all good? if not, fail so paleotree fails...
if(!identical(test,c(7,10,10,10,5,10,7,7))){stop("fixRootTime fails!")}


##############
#testing bindPaleoTip

# simple example 
tree <- read.tree(text = "(A:3,(B:2,(C:5,D:3):2):3);")
tree$root.time <- 20
plot(tree,no.margin = FALSE)
axisPhylo()

## Not run: 
##D 
##D require(phytools)
##D 
##D #bindPaleoTip effectively wraps bind.tip from phytools
##D # using a conversion like below
##D 
##D tipAge <- 5
##D node <- 6
##D 
##D #new length = the root time - tipAge - nodeheight(tree,node)
##D 
##D newLength <- tree$root.time-tipAge-nodeheight(tree,node)
##D tree1 <- bind.tip(tree,"tip.label",where = node,edge.length = newLength)
##D 
##D layout(1:2)
##D plot(tree);axisPhylo()
##D plot(tree1);axisPhylo()
##D 
## End(Not run)

# now with bindPaleoTip


tree1 <- bindPaleoTip(tree,"new",nodeAttach = 6,tipAge = 5)

layout(1:2)
plot(tree);axisPhylo()
plot(tree1);axisPhylo()
layout(1)

#then the tip age of "new" should 5
test <- dateNodes(tree1)[which(tree1$tip.label == "new")] == 5
if(!test){stop("bindPaleoTip fails!")}

# with positionBelow

tree1 <- bindPaleoTip(tree,"new",nodeAttach = 6,tipAge = 5,positionBelow = 1)

layout(1:2)
plot(tree);axisPhylo()
plot(tree1);axisPhylo()
layout(1)

# at the root

tree1 <- bindPaleoTip(tree,"new",nodeAttach = 5,tipAge = 5)

layout(1:2)
plot(tree);axisPhylo()
plot(tree1);axisPhylo()
layout(1)

#then the tip age of "new" should 5
test <- dateNodes(tree1)[which(tree1$tip.label == "new")] == 5
if(!test){stop("bindPaleoTip fails!")}

# at the root with positionBelow

tree1 <- bindPaleoTip(tree,"new",nodeAttach = 5,tipAge = 5,
	positionBelow = 3)

layout(1:2)
plot(tree);axisPhylo()
plot(tree1);axisPhylo()
layout(1)

#then the tip age of "new" should 5
test <- dateNodes(tree1)[which(tree1$tip.label == "new")] == 5
#and the root age should be 23
test1 <- tree1$root.time == 23
if(!test | !test1){stop("bindPaleoTip fails!")}




