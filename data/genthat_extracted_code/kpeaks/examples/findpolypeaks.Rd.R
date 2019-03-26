library(kpeaks)


### Name: findpolypeaks
### Title: Find the Peaks of a Frequency Polygon
### Aliases: findpolypeaks

### ** Examples

data(x5p4c)
# Using a user-specified number of bins, build the frequency polygon of p2 in the data set x5p4c
hvals <- genpolygon(x5p4c$p2, binrule="usr", nbins=20)
plotpolygon(x5p4c$p2, nbins=hvals$nbins, ptype="ph")

# Find the peaks in the frequency polygon by using the threshold method min
resfpp1 <- findpolypeaks(hvals$mids, hvals$freqs, tcmethod="min")
print(resfpp1)

# Find the peaks in the frequency polygon by using the threshold equals to 5
resfpp2 <- findpolypeaks(hvals$mids, hvals$freqs, tcmethod="usr", tc=5)
print(resfpp2)

data(iris)
# By using Doane rule, build the frequency polygon of the 4th feature in the data set iris
hvals <- genpolygon(iris[,4], binrule="doane")
plotpolygon(iris[,4], nbins=hvals$nbins, ptype="p")

#Find the peaks in the frequency polygon by using the threshold method avg
resfpp3 <- findpolypeaks(hvals$mids, hvals$freqs, tcmethod="avg")
print(resfpp3)



