library(mvbutils)


### Name: mcut
### Title: Put reals and integers into specified bins, returning factors.
### Aliases: mcut mintcut
### Keywords: misc

### ** Examples

set.seed( 1)
mcut( runif( 5), c( 0.25, 0.5, 0.75))
# [1] [0.25,0.50] [0.25,0.50] [0.50,0.75] [>=0.75]     [<0.25]
# Levels: [<0.25] [0.25,0.50] [0.50,0.75] [>=0.75]
 mcut( runif( 5), c( 0.25, 0.5, 0.75), pre.lab='A', post.lab='B', digits=1)
# [1] A[>=0.8]B    A[>=0.8]B    A[0.5,0.8]B A[0.5,0.8]B A[<0.2]B
# Levels: A[<0.2]B A[0.2,0.5]B A[0.5,0.8]B A[>=0.8]B
mintcut( 1:8, c( 2, 4, 7))
# [1] <NA> 2-3  2-3  4-6  4-6  4-6  7+   7+
# Levels: 2-3 4-6 7+
mintcut( c( 1, 2, 4)) # auto bins, size defaulting to 1
# [1] 1  2  4+
# Levels: 1 < 2 < 3 < 4+
mintcut( c( 1, 2, 6), by=2) # auto bins of size 2
# [1] 1-2 1-2 5+
# Levels: 1-2 < 3-4 < 5+



