library(flexclust)


### Name: stripes
### Title: Stripes Plot
### Aliases: stripes
### Keywords: hplot

### ** Examples

bw05 <- bundestag(2005)
bavaria <- bundestag(2005, state="Bayern")

set.seed(1)
c4 <- cclust(bw05, k=4, save.data=TRUE)
plot(c4)

stripes(c4)
stripes(c4, beside=TRUE)

stripes(c4, type="sec")
stripes(c4, type="sec", beside=FALSE)
stripes(c4, type="all")

stripes(c4, groups=bavaria)

## ugly, but shows how colors of all parts can be changed
library("grid")
stripes(c4, type="all",
        gp.bar=gpar(col="red", lwd=3, fill="white"),
        gp.bar2=gpar(col="green", lwd=3, fill="black"))




