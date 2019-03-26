library(vegan)


### Name: permutest.betadisper
### Title: Permutation test of multivariate homogeneity of groups
###   dispersions (variances)
### Aliases: permutest.betadisper
### Keywords: methods multivariate

### ** Examples

data(varespec)

## Bray-Curtis distances between samples
dis <- vegdist(varespec)

## First 16 sites grazed, remaining 8 sites ungrazed
groups <- factor(c(rep(1,16), rep(2,8)), labels = c("grazed","ungrazed"))

## Calculate multivariate dispersions
mod <- betadisper(dis, groups)
mod

## Perform test
anova(mod)

## Permutation test for F
pmod <- permutest(mod, permutations = 99, pairwise = TRUE)

## Tukey's Honest Significant Differences
(mod.HSD <- TukeyHSD(mod))
plot(mod.HSD)

## Has permustats() method
pstat <- permustats(pmod)
densityplot(pstat, scales = list(x = list(relation = "free")))
qqmath(pstat, scales = list(relation = "free"))



