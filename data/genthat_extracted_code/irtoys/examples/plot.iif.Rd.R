library(irtoys)


### Name: plot.iif
### Title: A plot method for item information functions
### Aliases: plot.iif
### Keywords: models

### ** Examples


# plot IIF for all items in red, label with item number
plot(iif(Scored2pl), co="red", label=TRUE)
# plot IIF for items 2, 3, and 7 in different colours
plot(iif(Scored2pl, items=c(2,3,7)), co=NA)




