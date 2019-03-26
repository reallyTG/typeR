library(iNextPD)


### Name: plot.iNextPD
### Title: Plotting iNextPD object
### Aliases: plot.iNextPD

### ** Examples


# single-assemblage abundance data
data(bird)
bird.phy <- ade4::newick2phylog(bird$tre)
bird.lab <- rownames(bird$abun)
out1 <- iNextPD(bird$abun$North.site, bird.lab, bird.phy, 
        q=1, datatype="abundance", endpoint=500)
plot(x=out1, type=1)
plot(x=out1, type=2)
plot(x=out1, type=3)




