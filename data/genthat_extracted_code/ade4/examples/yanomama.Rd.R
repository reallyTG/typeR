library(ade4)


### Name: yanomama
### Title: Distance Matrices
### Aliases: yanomama
### Keywords: datasets

### ** Examples

    data(yanomama)
    gen <- quasieuclid(as.dist(yanomama$gen)) # depends of mva
    ant <- quasieuclid(as.dist(yanomama$ant)) # depends of mva
    par(mfrow = c(2,2))
    plot(gen, ant)
    t1 <- mantel.randtest(gen, ant, 99);
    plot(t1, main = "gen-ant-mantel") ; print(t1)
    t1 <- procuste.rtest(pcoscaled(gen), pcoscaled(ant), 99)
    plot(t1, main = "gen-ant-procuste") ; print(t1)
    t1 <- RV.rtest(pcoscaled(gen), pcoscaled(ant), 99)
    plot(t1, main = "gen-ant-RV") ; print(t1)



