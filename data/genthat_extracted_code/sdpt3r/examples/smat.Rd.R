library(sdpt3r)


### Name: smat
### Title: Create a Symmetrix Matrix
### Aliases: smat

### ** Examples


y <- c(1,0.00000279, 3.245, 2.140, 2.44, 2.321, 4.566)

blk <- matrix(list(),1,2)
blk[[1,1]] <- "s"
blk[[1,2]] <- 3

P <- smat(blk,1, y)




