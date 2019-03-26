library(Directional)


### Name: Anova for (hyper-)spherical data
### Title: Analysis of variance for (hyper-)spherical data
### Aliases: hcf.aov lr.aov embed.aov het.aov
### Keywords: Analysis of variance (Hyper-)spherical data high
###   concentration F test

### ** Examples

x <- rvmf(60, rnorm(3), 15)
ina <- rep(1:3, each = 20)
hcf.aov(x, ina)
hcf.aov(x, ina, fc = FALSE)
lr.aov(x, ina)
embed.aov(x, ina)
het.aov(x, ina)



