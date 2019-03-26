library(ape)


### Name: evonet
### Title: Evolutionary Networks
### Aliases: evonet as.evonet as.evonet.phylo read.evonet write.evonet
###   print.evonet plot.evonet reorder.evonet as.phylo.evonet
###   as.networx.evonet as.network.evonet as.igraph.evonet Nedge.evonet
### Keywords: manip hplot

### ** Examples

tr <- rcoal(5)
(x <- evonet(tr, 6:7, 8:9))
plot(x)
## simple example of extended Newick format:
(enet <- read.evonet(text = "((a:2,(b:1)#H1:1):1,(#H1,c:1):2);"))
plot(enet, arrows=1)
## from Fig. 2 in Cardona et al. 2008:
z <- read.evonet(text =
"((1,((2,(3,(4)Y#H1)g)e,(((Y#H1, 5)h,6)f)X#H2)c)a,((X#H2,7)d,8)b)r;")
z
plot(z)
## Not run: 
##D if (require(igraph)) {
##D     plot(as.igraph(z))
##D }
## End(Not run)


