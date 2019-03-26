library(wmtsa)


### Name: wavMRDSum
### Title: Partial summation of a multiresolution decomposition
### Aliases: wavMRDSum
### Keywords: univar

### ** Examples

## create a MODWT-based MRD of the sunspots series 
## and sum over decomposition levels 4 to 6 
x <- as.vector(sunspots)
z1 <- wavMRDSum(x, levels=4:6)
ifultools::stackPlot(x=as.vector(time(sunspots)),
    y=list(sunspots=x, "D4+D5+D6"=z1),
    ylim=range(x,z1))



