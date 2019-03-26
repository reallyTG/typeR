library(ade4)


### Name: ungulates
### Title: Phylogeny and quantitative traits of ungulates.
### Aliases: ungulates
### Keywords: datasets

### ** Examples

data(ungulates)
ung.phy <- newick2phylog(ungulates$tre)
plot(ung.phy,clabel.l=1.25,clabel.n=0.75)
ung.x <- log(ungulates$tab[,1])
ung.y <- log((ungulates$tab[,2]+ungulates$tab[,3])/2)
names(ung.x) <- names(ung.phy$leaves)
names(ung.y) <- names(ung.x)
plot(ung.x,ung.y)
abline(lm(ung.y~ung.x))
symbols.phylog(ung.phy,ung.x-mean(ung.x))
dotchart.phylog(ung.phy,ung.x,cle=1.5,cno=1.5,cdot=1)
if (requireNamespace("adephylo", quietly = TRUE) & requireNamespace("ape", quietly = TRUE)) {
  tre <- ape::read.tree(text = ungulates$tre)
  adephylo::orthogram(ung.x, tre)
  ung.z <- residuals(lm(ung.y~ung.x))
  names(ung.z) <- names(ung.phy$leaves)
  dotchart.phylog(ung.phy,ung.z,cle=1.5,cno=1.5,cdot=1,ceti=0.75)
  adephylo::orthogram(ung.z, tre)
}



