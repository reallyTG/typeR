library(irtoys)


### Name: plot.irf
### Title: A plot method for item response functions
### Aliases: plot.irf
### Keywords: models

### ** Examples


# plot IRF for all items in red, label with item number
plot(irf(Scored2pl), co="red", label=TRUE)
# plot IRF for items 2, 3, and 7 in different colours
plot(irf(Scored2pl, items=c(2,3,7)), co=NA)




