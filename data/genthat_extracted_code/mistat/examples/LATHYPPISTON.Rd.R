library(mistat)


### Name: LATHYPPISTON
### Title: Latin Hypercube Design for the Piston Simulator
### Aliases: LATHYPPISTON
### Keywords: datasets

### ** Examples

data(LATHYPPISTON)

library(DiceEval)

Dice <- km(design=LATHYPPISTON[, !names(LATHYPPISTON) %in% "seconds"], 
            response=LATHYPPISTON[,"seconds"])

#library(DiceView)

#sectionview(Dice, 
#            center=colMeans(LATHYPPISTON[, !names(LATHYPPISTON) %in% "seconds"]), 
#            conf_lev=c(0.5, 0.9, 0.95), 
#            title="", col_sur="darkgrey", lwd=2,
#            Xname=colnames(LATHYPPISTON[, !names(LATHYPPISTON) %in% "seconds"]))


layout(1)



