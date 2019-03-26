library(labdsv)


### Name: pco
### Title: Principal Coordinates Analysis
### Aliases: pco
### Keywords: multivariate

### ** Examples

        data(bryceveg) # returns a vegetation data.frame
        dis.bc <- dsvdis(bryceveg,'bray/curtis')
                  # returns an object of class dist'
        veg.pco <- pco(dis.bc,k=4) # returns first 4 dimensions



