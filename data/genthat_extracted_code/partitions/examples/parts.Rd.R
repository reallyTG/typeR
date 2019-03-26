library(partitions)


### Name: parts
### Title: Enumerate the partitions of an integer
### Aliases: parts diffparts restrictedparts blockparts compositions
###   c_allblockparts c_alldiffparts c_allparts c_allperms
###   c_allrestrictedparts c_bintocomp c_comptobin c_conjugate c_durfee
###   c_nextblockpart c_nextdiffpart c_nextpart c_nextrestrictedpart
###   c_plainperms c_tobin c_wrap c_numbdiffparts c_numbparts
###   numbrestrictedparts_R
### Keywords: math

### ** Examples

parts(5)
diffparts(10)
restrictedparts(9,4)
restrictedparts(9,4,FALSE)
restrictedparts(9,4,decreasing=TRUE)

blockparts(1:4)
blockparts(1:4,3)
blockparts(1:4,3,include.fewer=TRUE)

blockparts(c(4,3,3,2),5)  # Knuth's example, Fascicle 3a, p16

compositions(4)           # not the same as parts(4)
compositions(4,4) 

# With 10 blocks, enumerate all partitions with maxima of 1:5 and minima
# of c(0,1,1,2,1):

a <- c(0,1,1,2,1)
sweep(blockparts(1:5-a,10-sum(a)),1,a,"+")




