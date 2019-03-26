library(vegan)


### Name: permustats
### Title: Extract, Analyse and Display Permutation Results
### Aliases: permustats permustats.adonis permustats.anosim
###   permustats.anova.cca permustats.CCorA permustats.envfit
###   permustats.factorfit permustats.mantel permustats.mrpp permustats.mso
###   permustats.oecosimu permustats.ordiareatest
###   permustats.permutest.betadisper permustats.permutest.cca
###   permustats.protest permustats.vectorfit summary.permustats
###   c.permustats densityplot.permustats density.permustats
###   qqnorm.permustats qqmath.permustats boxplot.permustats
### Keywords: distribution smooth

### ** Examples

data(dune, dune.env)
mod <- adonis2(dune ~ Management + A1, data = dune.env)
## use permustats
perm <- permustats(mod)
summary(perm)
densityplot(perm)
qqmath(perm)
boxplot(perm, scale=TRUE, lty=1, pch=16, cex=0.6, col="hotpink", ylab="SES")
abline(h=0, col="skyblue")
## example of multiple types of statistic
mod <- with(dune.env, betadisper(vegdist(dune), Management))
pmod <- permutest(mod, nperm = 99, pairwise = TRUE)
perm <- permustats(pmod)
summary(perm, interval = 0.90)



