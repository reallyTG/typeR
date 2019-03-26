library(sdpt3r)


### Name: svec
### Title: Upper Triangular Vectorization
### Aliases: svec

### ** Examples


data(Hnearcorr)
blk <- matrix(list(),1,2)
blk[[1]] <- "s"
blk[[2]] <- nrow(Hnearcorr)

svec(blk,Hnearcorr)




