library(inaparc)


### Name: inofrep
### Title: Initialization of cluster prototypes using Inofrep algorithm
### Aliases: inofrep
### Keywords: cluster

### ** Examples

data(iris)
# set 2nd feature as the selected feature
sfidx <- 2

# generate frequency polygon for the selected feature with user-defined class number
hvals <- kpeaks::genpolygon(iris[,sfidx], binrule="usr", nbins=20)

# Call findpolypeaks for calculating the peaks matrix for the peaks of frequency polygon
resfpp <- kpeaks::findpolypeaks(hvals$mids, hvals$freqs, tcmethod="min")
sfpm <- resfpp$pm

# Call inofrep with the peaks matrix calculated in previous step
v <- inofrep(x=iris[,1:4], k=5, sfidx=sfidx, sfpm=sfpm)$v
print(v)



