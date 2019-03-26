library(spider)


### Name: titv
### Title: Number of pairwise transitions and transversions in an
###   alignment.
### Aliases: titv
### Keywords: Utilities

### ** Examples


data(dolomedes)

subs <- titv(dolomedes)

#Transversions
subs[upper.tri(subs)]
tv <- t(subs)
tv <- tv[lower.tri(tv)]

#Transitions
ti <- subs[lower.tri(subs)]


#Saturation plot
doloDist <- ape::dist.dna(dolomedes)
graphics::plot(doloDist, ti, type="p", pch=19, col="blue", 
    main="Saturation plot of number of transitions and transversions\n
    against K2P distance. Red: transversions. Blue: transitions")
graphics::points(doloDist, tv, pch=19, col="red")





