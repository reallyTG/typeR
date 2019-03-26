library(Rsampletrees)


### Name: readTrees
### Title: Read in trees from a run of sampletrees.
### Aliases: readTrees

### ** Examples

#\dontrun{
treesname=paste(path.package("Rsampletrees"),"/extdata/Example-h_trees.out",sep="")
#system.file("Output/Example-h_trees.out", package="Rsampletrees")

# Read in all the trees in the file; may be slow
mytrees=readTrees(filename=treesname)
length(mytrees)

# Read in the first and 90th line
mytrees=readTrees(filename=treesname,all=FALSE, lines=c(1,40))
names(mytrees)

# Read in lines  2-4
mytrees=readTrees(filename=treesname,all=FALSE, lines=2:4)
names(mytrees)

# Read in three 3 starting at line 2
mytrees=readTrees(filename=treesname, all=FALSE, start=2, nlines=3)
names(mytrees)

# Read in lines 2-4
mytrees=readTrees(filename=treesname, all=FALSE, start=2, end=4)
names(mytrees)

#}



