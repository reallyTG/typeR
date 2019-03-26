library(SuppDists)


### Name: Spearman
### Title: Spearman's rho
### Aliases: dSpearman pSpearman qSpearman rSpearman sSpearman
### Keywords: distribution

### ** Examples


pSpearman(.95, 10)
pSpearman(c(-0.55,0,0.55), 10) ## approximately 5% 50% and 95% 
sSpearman(10)
plot(function(x)dSpearman(x, 10),-.9,.9)






