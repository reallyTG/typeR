library(adiv)


### Name: decdiv
### Title: Decomposition of trait-based diversity along the nodes of a
###   phylogenetic tree
### Aliases: decdiv plot.decdiv rtestdecdiv
### Keywords: models

### ** Examples

data(ungulates)
ung.phy <- read.tree(text=ungulates$tre)
ung.phy$node.label
plot(ung.phy, show.node.label=TRUE)
# Regaring traits, we log-tranformed the first three traits 
# measuring volumes 
# and we standardized all the traits (mean=0; variance=1).
tab <- cbind.data.frame(afbw = log(ungulates$tab$afbw),
mnw = log(ungulates$tab$mnw), fnw = log(ungulates$tab$fnw),
ls = ungulates$tab$ls)
ung.tab0 <- data.frame(scalewt(tab))
ung.tab0 <- data.frame(scalewt(log(ungulates$tab)))
ung.pres <- rep(1, nrow(ung.tab0))
names(ung.pres) <- rownames(ung.tab0)
ung.dec1 <- decdiv(ung.phy, ung.pres, dist(ung.tab0), 
    option=1, formula = "EDI")
plot.decdiv(ung.dec1)

ung.dec2 <- decdiv(ung.phy, ung.pres, dist(ung.tab0), 
    option=2, formula = "EDI")
plot.decdiv(ung.dec2)

ung.dec3 <- decdiv(ung.phy, ung.pres, dist(ung.tab0), 
    option=3, formula = "EDI")
plot.decdiv(ung.dec3)

ung.dec4 <- decdiv(ung.phy, ung.pres, dist(ung.tab0), 
    option=4, formula = "EDI")
plot.decdiv(ung.dec4)

ung.dec5 <- decdiv(ung.phy, ung.pres, dist(ung.tab0), 
    option=5, formula = "EDI")
plot.decdiv(ung.dec5)



