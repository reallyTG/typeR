library(sievetest)


### Name: tweak.std
### Title: Modify std object
### Aliases: tweak.std
### Keywords: utilities

### ** Examples

# Load the data, modify linear model and plot.
data(lignite)
std1 <- lignite[2]
std2 <- tweak.std(lignite[2],lmargs = list(weights=c(1,1,0,1)),
        desc = desc.std(x=std1,Title="Lignite w 1 1 0 1"))
plot(c(std1,std2))



