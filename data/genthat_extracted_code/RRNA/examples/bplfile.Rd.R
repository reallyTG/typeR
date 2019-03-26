library(RRNA)


### Name: bplfile
### Title: Creates a bpl file from a coordinate file
### Aliases: bplfile
### Keywords: RNA bpl

### ** Examples

ct=makeCt("((((...))))","AAAACCCUUUU")
### Create the coordinate file ###
dat=ct2coord(ct)

bplfile(dat,"test.bpl")



