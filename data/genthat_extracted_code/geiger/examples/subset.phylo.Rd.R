library(geiger)


### Name: subset.phylo
### Title: blending information from taxonomies and trees
### Aliases: subset.phylo
### Keywords: graphs manip

### ** Examples

sal <- get(data(caudata))
print(head(sal$tax))

nphy <- subset(sal$phy, sal$tax, "genus", ncores=1)
plot(nphy, type="fan", cex=0.15)




