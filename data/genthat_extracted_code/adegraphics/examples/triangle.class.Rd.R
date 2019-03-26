library(adegraphics)


### Name: triangle.class
### Title: Ternary plot with a partition in classes (levels of a factor)
### Aliases: triangle.class
### Keywords: hplot aplot

### ** Examples

data(euro123, package = "ade4")
fac1 <- euro123$plan$an
df1 <- rbind.data.frame(euro123$in78, euro123$in86, euro123$in97)
triangle.class(df1, fac = fac1, showposition = TRUE, col = c(1, 2, 3))
triangle.class(df1, fac = fac1, showposition = FALSE, plabels.cex = 0, col = c(1, 2, 3), 
  key = list(space = "left"))



