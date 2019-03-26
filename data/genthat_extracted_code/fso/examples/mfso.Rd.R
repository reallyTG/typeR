library(fso)


### Name: mfso
### Title: Multidimensional Fuzzy Set Ordination
### Aliases: mfso mfso.default mfso.formula summary.mfso
### Keywords: multivariate

### ** Examples

    require(labdsv)
    data(bryceveg) # returns a vegetation dataframe
    data(brycesite) # returns a dataframe of environmental variables
    dis.bc <- dsvdis(bryceveg,'bray/curtis')
                  # returns an object of class sQuote{dist}
    demo.mfso <- mfso(~elev+slope+av,dis.bc,data=brycesite) # creates the mfso
    summary(demo.mfso)
    ## Not run: plot(demo.mfso)



