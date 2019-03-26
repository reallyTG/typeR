library(rphast)


### Name: read.newick.tree
### Title: Read a Newick Tree from a File
### Aliases: read.newick.tree
### Keywords: newick trees

### ** Examples

cat(c("((hg18:0.142679,(mm9:0.083220,rn4:0.090564):0.269385):0.020666,canFam2:0.193569);",
      "(human, (mouse, rat));",
      sep="\n"), file="test.nh")
read.newick.tree("test.nh")
unlink("test.nh")



