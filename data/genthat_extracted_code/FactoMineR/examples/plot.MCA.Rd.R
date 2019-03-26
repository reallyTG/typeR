library(FactoMineR)


### Name: plot.MCA
### Title: Draw the Multiple Correspondence Analysis (MCA) graphs
### Aliases: plot.MCA
### Keywords: dplot

### ** Examples

data (poison)
res.mca = MCA (poison, quali.sup = 3:4, quanti.sup = 1:2, graph=FALSE)
plot(res.mca,invisible=c("var","quali.sup"))
plot(res.mca,invisible="ind")
plot(res.mca,choix="var")
plot(res.mca,invisible=c("ind"),autoLab="yes", selectMod="cos2 10")
plot(res.mca,autoLab="yes", selectMod="cos2 5", select="cos2 5")



