library(flexclust)


### Name: flxColors
### Title: Flexclust Color Palettes
### Aliases: flxColors flxPalette
### Keywords: color

### ** Examples

opar <- par(c("mfrow", "mar", "xaxt"))
par(mfrow=c(2, 2), mar=c(0, 0, 2, 0), yaxt="n")

x <- rep(1, 8)

barplot(x, col = flxColors(color="full"), main="full")
barplot(x, col = flxColors(color="dark"), main="dark")
barplot(x, col = flxColors(color="medium"), main="medium")
barplot(x, col = flxColors(color="light"), main="light")

par(opar)



