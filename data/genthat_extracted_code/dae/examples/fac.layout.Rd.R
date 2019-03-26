library(dae)


### Name: fac.layout
### Title: Generate a randomized layout for an experiment
### Aliases: fac.layout
### Keywords: design factor datagen

### ** Examples

## generate a randomized layout for a 4 x 4 Latin square
## (the nested.factors agument is not needed here as none of the 
## factors are nested)
LS.unit <- data.frame(row = ordered(rep(c("I","II","III","IV"), times=4)), 
                      col = factor(rep(c(0,2,4,6), each=4)))
LS.ran <- data.frame(treat = factor(c(1:4, 2,3,4,1, 3,4,1,2, 4,1,2,3)))
data.frame(LS.unit, LS.ran)
LS.lay <- fac.layout(unrandomized=LS.unit, randomized=LS.ran, seed=7197132) 
LS.lay[LS.lay$.Permutation,]

## generate a randomized layout for a replicated randomized complete 
## block design, with the block factors arranged in standard order for 
## rep then plot and then block
RCBD.unit <- list(rep = 2, plot=1:3, block = c("I","II"))
## specify that plot is nested in block and rep and that block is nested
## in rep
RCBD.nest <- list(plot = c("block","rep"), block="rep")
## generate treatment factor in systematic order so that they correspond
## to plot
tr <- factor(rep(1:3, each=2, times=2))
## obtain randomized layout
RCBD.lay <- fac.layout(unrandomized=RCBD.unit, 
                       nested.factors=RCBD.nest, 
                       randomized=tr, seed=9719532)
#sort into the original standard order
RCBD.perm <- RCBD.lay[RCBD.lay$.Permutation,]
#resort into randomized order
RCBD.lay <- RCBD.perm[order(RCBD.perm$.Units),]

## generate a layout for a split-unit experiment in which: 
## - the main-unit factor is A with 4 levels arranged in 
##   a randomized complete block design with 2 blocks;
## - the split-unit factor is B with 3 levels.
SPL.lay <- fac.layout(unrandomized=list(block = 2, main.unit = 4, split.unit = 3), 
                       nested.factors=list(main.unit = "block", 
                                           split.unit = c("block", "main.unit")), 
                       randomized=fac.gen(list(A = 4, B = 3), times = 2), 
                       seed=155251978, unit.permutation=FALSE)



