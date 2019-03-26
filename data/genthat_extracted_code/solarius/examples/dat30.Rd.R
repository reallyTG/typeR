library(solarius)


### Name: dat30
### Title: dat30 data set adapted from multic R package
### Aliases: dat30 genocovdat30 mapdat30

### ** Examples

data(dat30)

str(dat30)

plotPed(dat30, 2) # plot the pedigree tree for family #2

## Not run: 
##D kin2 <- solarKinship2(dat30)
##D plotKinship2(kin2)
##D plotKinship2(kin2[1:30, 1:30])
##D 
## End(Not run)
str(genocovdat30)

genocovdat30[1:5, 1:5]
str(mapdat30)

head(mapdat30)



