library(archdata)


### Name: Fibulae
### Title: Bronze La Tene fibulae from Munsingen, Switzerland
### Aliases: Fibulae
### Keywords: datasets

### ** Examples

data(Fibulae)
t(sapply(Fibulae[, 3:16], quantile, na.rm=TRUE))
plot(density(Fibulae$Length, bw="SJ"), main="Kernel Density Plot of Length")



