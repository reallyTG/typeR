library(bipartite)


### Name: compart
### Title: Detects compartments
### Aliases: compart
### Keywords: package

### ** Examples

# make a nicely comparted web:
web <- matrix(0, 10,10)
web[1,1:3] <- 1 
web[2,4:5] <- 1 
web[3:7, 6:8] <- 1
web[8:10, 9:10] <- 1
web <- web[-c(4:5),] #oh, and make it asymmetric!
web <- web[,c(1:5, 9,10, 6:8)] #oh, and make it non-diagonal
compart(web)

# or, standard, use Safariland as example:
data(Safariland)
compart(Safariland)



