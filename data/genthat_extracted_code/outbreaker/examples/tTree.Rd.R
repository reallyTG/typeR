library(outbreaker)


### Name: get.tTree
### Title: Simple transmission tree from outreaber's output
### Aliases: get.tTree tTree plot.tTree as.igraph.tTree findMutations.tTree
###   as.igraph.tTree findMutations.tTree plot.tTree
### Keywords: classes

### ** Examples


data(fakeOutbreak)
attach(fakeOutbreak)

## represent posterior ancestries
if(require(adegenet)){
transGraph(res, annot="", main="Posterior ancestries - support > 0.01",
   threshold=0.01, col.pal=spectral)
}
## get consensus ancestries
tre <- get.tTree(res)
plot(tre, annot="", main="Consensus ancestries")

## show match data/consensus ancestries
col <- rep("lightgrey", 30)
col[which(dat$ances != tre$ances)] <- "pink"
plot(tre, annot="", vertex.color=col, main="Consensus ancestries")
mtext(side=3, text="cases with erroneous ancestries in pink")


detach(fakeOutbreak)





