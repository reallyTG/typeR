library(marmap)


### Name: is.bathy
### Title: Test whether an object is of class bathy
### Aliases: is.bathy

### ** Examples

# load NW Atlantic data
data(nw.atlantic)

# test class "bathy"
is.bathy(nw.atlantic)

# use as.bathy
atl <- as.bathy(nw.atlantic)

# class "bathy"
class(atl)
is.bathy(atl)

# summarize data of class "bathy"
summary(atl)




