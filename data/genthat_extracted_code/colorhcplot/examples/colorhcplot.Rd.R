library(colorhcplot)


### Name: colorhcplot
### Title: Colorful Hierarchical Clustering Dendrograms
### Aliases: colorhcplot

### ** Examples

### Example 1, using the USArrests dataset
data(USArrests)
hc <- hclust(dist(USArrests), "ave")
fac <- as.factor(c(rep("group 1", 10), 
                   rep("group 2", 10), 
                   rep("unknown", 30)))
plot(hc)
colorhcplot(hc, fac)
colorhcplot(hc, fac, hang = -1, lab.cex = 0.8)

### Example 2: use the "ward.D2" algorithm and
### the UScitiesD dataset
data(UScitiesD)
hcity.D2 <- hclust(UScitiesD, "ward.D2")
fac.D2 <-as.factor(c(rep("group1", 3), 
                     rep("group2", 7)))
plot(hcity.D2, hang=-1)
colorhcplot(hcity.D2, fac.D2, color = c("chartreuse2", "orange2"))
colorhcplot(hcity.D2, fac.D2, color = "gray30", lab.cex = 1.2, lab.mar = 0.75)

### Example 3: use gene expression data 
data(geneData, package="colorhcplot")
exprs <- geneData$exprs
fac <- geneData$fac
hc <- hclust(dist(t(exprs)))
colorhcplot(hc, fac, main ="default", col = "gray10")
colorhcplot(hc, fac, main="Control vs. Tumor Samples") 



