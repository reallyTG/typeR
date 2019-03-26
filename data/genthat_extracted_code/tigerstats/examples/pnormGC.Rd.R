library(tigerstats)


### Name: pnormGC
### Title: Graphical Calculator for Normal Curve Probabilities
### Aliases: pnormGC

### ** Examples

#This gives P(X < 75) for X normal with mean=70 and sd=4:
pnormGC(75,region="below",mean=70,sd=4)

#This gives P(X > 71) for X normal with mean=70 and sd=4:
pnormGC(71,region="above",mean=70,sd=4)

#This gives P(-1 < X < 1), for standard normal X:
pnormGC(c(-1,1),region="between")

#This gives P(X < 68 or X > 71), for X normal with mean =70 and sd=4:
pnormGC(c(68,71),region="outside",mean=70,sd=4)



