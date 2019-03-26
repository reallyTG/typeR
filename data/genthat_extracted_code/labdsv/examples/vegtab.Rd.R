library(labdsv)


### Name: vegtab
### Title: Vegetation Table
### Aliases: vegtab
### Keywords: multivariate

### ** Examples

    data(bryceveg) # returns a vegetation data frame called bryceveg
    data(brycesite) # returns an environmental data frame called brycesite
    vegtab(bryceveg,minval=10,pltord=brycesite$elev)
        # produces a sorted table for species whose abundance sums
        # to 10, with rows in order of elevation.



