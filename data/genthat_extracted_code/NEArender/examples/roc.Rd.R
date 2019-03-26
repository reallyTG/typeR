library(NEArender)


### Name: roc
### Title: ROC for NEA benchmarks
### Aliases: roc
### Keywords: benchmark

### ** Examples

# Benchmark and plot one networks on the whole set of test GSs, using no mask:
data(can.sig.go);
fpath <- can.sig.go
gs.list <- import.gs(fpath, Lowercase = 1, col.gene = 2, col.set = 3);
data(net.kegg)
netpath <- net.kegg
net <- import.net(netpath)
## No test: 
b0 <- benchmark (NET = net,
 GS = gs.list,
 echo=1, graph=TRUE, na.replace = 0, mask = ".", minN = 0,
 coff.z = 1.965, coff.fdr = 0.1, Parallelize=2);
 roc(b0, coff.z = 1.64);
## End(No test)
## Not run: 
##D ## Benchmark and plot a number of networks on GO terms and KEGG pathways separately, using masks
##D b1 <- NULL;
##D for (mask in c("kegg_", "go_")) {
##D b1[[mask]] <- NULL;
##D for (file.net in c("netpath")) {
##D # a series of networks can be put here: c("netpath1", "netpath2", "netpath3")
##D net <- import.net(netpath, col.1 = 1, col.2 = 2, Lowercase = 1, echo = 1)
##D b1[[mask]][[file.net]] <- benchmark (NET = net, GS = gs.list,
##D gs.gene.col = 2, gs.group.col = 3, net.gene1.col = 1, net.gene2.col = 2,
##D echo=1, graph=FALSE, na.replace = 0, mask = mask, minN = 0, Parallelize=2);
##D }}
##D par(mfrow=c(2,1));
##D roc(b1[["kegg_"]], coff.z = 2.57,main="kegg_");
##D roc(b1[["go_"]], coff.z = 2.57,main="go_");
## End(Not run)




