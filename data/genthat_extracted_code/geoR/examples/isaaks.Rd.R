library(geoR)


### Name: isaaks
### Title: Data from Isaaks and Srisvastava's book
### Aliases: isaaks
### Keywords: datasets

### ** Examples

isaaks
summary(isaaks)
plot(isaaks$coords, asp=1, type="n")
text(isaaks$coords, as.character(isaaks$data))
points(isaaks$x0, pch="?", cex=2, col=2)



