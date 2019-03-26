library(ade4)


### Name: mantel.randtest
### Title: Mantel test (correlation between two distance matrices (in C).)
### Aliases: mantel.randtest
### Keywords: array nonparametric

### ** Examples

data(yanomama)
gen <- quasieuclid(as.dist(yanomama$gen))
geo <- quasieuclid(as.dist(yanomama$geo))
plot(r1 <- mantel.randtest(geo,gen), main = "Mantel's test")
r1



