library(geiger)


### Name: gbresolve
### Title: NCBI taxonomy
### Aliases: gbresolve.phylo gbresolve gbcontain
### Keywords: data graphs

### ** Examples

## No test: 
## call up NCBI taxonomy
ncbi=ncbit::ncbit(update=FALSE)

## possible ranks
print(Linnaean)

## resolve taxa
gbresolve(c("Ambystoma_laterale", "Dicamptodon_copei"))
gbresolve("Andrias japonicus")


## resolve taxa found in tree
sal=get(data(caudata))
x=gbresolve(sal$phy, rank=c("genus", "order"))
plot(x$phy, show.node=TRUE, type="f", show.tip=FALSE, cex=0.3)

## find all genera within salamanders
gbcontain("caudata", rank="genus")
## End(No test)



