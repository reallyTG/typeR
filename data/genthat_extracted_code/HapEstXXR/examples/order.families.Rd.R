library(HapEstXXR)


### Name: order.families
### Title: Ordering of nuclear family data
### Aliases: order.families
### Keywords: families sort

### ** Examples


fam <- as.character(c(c(1, 1, 1, 1), c(0, 0, 0, 0, 0)))
pid <- as.character(c(c(1, 2, 3, 4), c(7, 8, 9, 10, 11)))
mid <- as.character(c(c(3, 3, 0, 0), c(10, 10, 10, 0, 0)))
fid <- as.character(c(c(4, 4, 0, 0), c(11, 11, 11, 0, 0)))
sex <- as.character(c(c(0, 2, 2, 1), c(1, 1, 2, 2, 1)))

ordfam <- order.families (fam, pid, fid, mid, sex)
print((cbind(fam, pid, fid, mid, sex))[ordfam, ])

    



