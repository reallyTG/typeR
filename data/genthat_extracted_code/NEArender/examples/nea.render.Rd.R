library(NEArender)


### Name: nea.render
### Title: Network Enrichment Analysis (NEA)
### Aliases: nea.render
### Keywords: AGS FGS

### ** Examples

ags.list <- samples2ags(fantom5.43samples, Ntop=20, method="topnorm")
data(can.sig.go)
fpath <- can.sig.go
fgs.list <- import.gs(fpath)
summary(fgs.list)
data(net.kegg)
netpath <- net.kegg
net <- import.net(netpath)
n1 <- nea.render(AGS=ags.list[1:10], FGS=fgs.list[1:10], NET=net, graph=FALSE)
hist(n1$chi, breaks=100)
hist(n1$z, breaks=100)
hist(n1$p, breaks=100)
hist(n1$q, breaks=100)



