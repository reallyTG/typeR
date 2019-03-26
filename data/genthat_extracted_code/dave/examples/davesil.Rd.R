library(dave)


### Name: davesil
### Title: Modified version of silhouette plotting
### Aliases: davesil davesil.default plot.davesil dsil
### Keywords: cluster hplot

### ** Examples

# An oridinary cluster analysis
ddr<- as.dist((1-cor(t(nveg)))/2)         # distance matrix, correlation as distance
o.hclr<- hclust(ddr,method="complete")
o.relgr<- cutree(o.hclr,k=3)
# Getting silhouette plot
o.davesil<- davesil(ddr,o.hclr,o.relgr)
plot(o.davesil)



