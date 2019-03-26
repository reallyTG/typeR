library(optpart)


### Name: optindval
### Title: Optimizing Classification by Maximizing Dufrene and Legendre's
###   Indicator Value
### Aliases: optindval
### Keywords: cluster

### ** Examples

    data(shoshveg) # returns a data.frame of vegetation data called shoshveg
    dis.bc <- dsvdis(shoshveg,'bray') # generate Bray/Curtis dissimilarity matrix
    opt.5 <- optpart(5,dis.bc) # generate 5-cluster optpart
    ## Not run: res <- optindval(shoshveg,opt.5) # polish the optpart result
    ## Not run: classmatch(opt.5,res) # see the plot re-assignments



