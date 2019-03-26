library(optpart)


### Name: reordclust
### Title: Re-order Clusters in a Classification
### Aliases: reordclust
### Keywords: clustering

### ** Examples

    data(shoshveg)
    dis.bc <- dsvdis(shoshveg,'bray')
    opt.10 <- optpart(10,dis.bc)
    new <- reordclust(opt.10,1:10,c(1,3,5,7,9,2,4,6,8,10))
           # simply re-ordered
    new2 <- reordclust(opt.10,1:10,c(1,1,2,2,3,3,4,4,5,5))
           # merge 1 and 2 into 1, 3 and 4 into 2, etc.



