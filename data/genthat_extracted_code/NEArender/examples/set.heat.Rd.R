library(NEArender)


### Name: set.heat
### Title: Plot a heatmap of NEA/GSEA output
### Aliases: set.heat
### Keywords: internal

### ** Examples

ags.list <- samples2ags(fantom5.43samples, Ntop=20, method="topnorm")
data(can.sig.go)
fpath <- can.sig.go
fgs.list <- import.gs(fpath)
data(net.kegg)
netpath <- net.kegg
net <- import.net(netpath)
n1 <- nea.render(AGS=ags.list, FGS=fgs.list, NET=net, graph=TRUE)
set.heat(ags.list, fgs.list, n1$z, Log=FALSE)



