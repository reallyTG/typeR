library(kpeaks)


### Name: plotpolygon
### Title: Plot Frequency Polygons
### Aliases: plotpolygon

### ** Examples

# plot the frequency polygon of the 2nd feature in x5p4c data set
data(x5p4c)
hvals <- genpolygon(x5p4c[,2], binrule="usr", nbins=20)

# plot the frequency polygon of the 2nd feature in x5p4c data set
plotpolygon(x5p4c[,2], nbins=hvals$nbins, ptype="p")

# plot the histogram and frequency polygon of the 2nd feature in x5p4c data set
plotpolygon(x5p4c[,2], nbins=hvals$nbins, ptype="ph", bcol="orange", pcol="blue")

# plot the pairwise scatter plots of the features in x5p4c data set
pairs(x5p4c, diag.panel=plotpolygon, upper.panel=NULL, cex.labels=1.5)

# plot the histogram and frequency polygon of Petal.Width in iris data set 
data(iris)
hvals <- genpolygon(iris$Petal.Width, binrule="doane")
plotpolygon(iris$Petal.Width, nbins=hvals$nbins, ptype="ph")



