library(ade4)


### Name: dotchart.phylog
### Title: Representation of many quantitative variables in front of a
###   phylogenetic tree
### Aliases: dotchart.phylog
### Keywords: hplot

### ** Examples

# one variable
tre <- c("((A,B),(C,D));")
phy <- newick2phylog(tre)
x <- 1:4
par(mfrow = c(2,2))
dotchart.phylog(phy, x, scaling = FALSE)
dotchart.phylog(phy, x)
dotchart.phylog(phy, x, joining = FALSE)
dotchart.phylog(phy, x, scaling = FALSE,
 yjoining = 0, yranging = c(-1, 5))
par(mfrow = c(1,1))

# many variables
data(mjrochet)
phy <- newick2phylog(mjrochet$tre)
tab <- data.frame(log(mjrochet$tab))
dotchart.phylog(phy, tab, ceti = 0.5, csub = 0.6,
 cleaves = 0, cdot = 0.6)
par(mfrow=c(1,1))



