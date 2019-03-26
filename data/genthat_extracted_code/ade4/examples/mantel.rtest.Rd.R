library(ade4)


### Name: mantel.rtest
### Title: Mantel test (correlation between two distance matrices (in R).)
### Aliases: mantel.rtest
### Keywords: array nonparametric

### ** Examples

    data(yanomama)
    gen <- quasieuclid(as.dist(yanomama$gen))
    geo <- quasieuclid(as.dist(yanomama$geo))
    plot(r1 <- mantel.rtest(geo,gen), main = "Mantel's test")
    r1



