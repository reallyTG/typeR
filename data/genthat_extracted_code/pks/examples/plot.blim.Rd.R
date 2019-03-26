library(pks)


### Name: plot.blim
### Title: Diagnostic Plot for Basic Local Independence Models
### Aliases: plot.blim
### Keywords: models

### ** Examples

## Compare MD and MDML estimation

data(DoignonFalmagne7)
blim1 <- blim(DoignonFalmagne7$K, DoignonFalmagne7$N.R, method="MD")
blim2 <- blim(DoignonFalmagne7$K, DoignonFalmagne7$N.R, method="MDML")

par(mfrow = 1:2)      # residuals versus fitted values
plot(blim1, main = "MD estimation",   ylim = c(-4, 4))
plot(blim2, main = "MDML estimation", ylim = c(-4, 4))



