library(bipartite)


### Name: strength
### Title: Computes species strength according to either of two definitions
### Aliases: strength
### Keywords: package

### ** Examples

data(Safariland)
s1 <- strength(Safariland, type="Barrat")
s2 <- strength(Safariland, type="Bascompte")
plot(s1, s2, log="x")
cor.test(s1, s2, type="ken")
# for lower level:
strength(t(Safariland))




