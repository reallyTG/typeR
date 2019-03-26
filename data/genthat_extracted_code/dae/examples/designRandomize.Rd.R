library(dae)


### Name: designRandomize
### Title: Randomize allocated to recipient factors to produce a layout for
###   an experiment
### Aliases: designRandomize
### Keywords: design factor datagen

### ** Examples

## generate a randomized layout for a 4 x 4 Latin square
## (the nested.recipients agument is not needed here as none of the 
## factors are nested)
LS.unit <- data.frame(row = ordered(rep(c("I","II","III","IV"), times=4)), 
                      col = factor(rep(c(0,2,4,6), each=4)))
LS.trt <- data.frame(treat = factor(designLatinSqrSys(4), label = LETTERS[1:4]))
data.frame(LS.unit, LS.trt)
LS.lay <- designRandomize(allocated = LS.trt, recipient = LS.unit, 
                          seed = 7197132, unit.permutation = TRUE) 
LS.lay[LS.lay$.Permutation,]

## generate a randomized layout for a replicated randomized complete 
## block design, with the block factors arranged in standard order for 
## rep then plot and then block
RCBD.unit <- list(rep = 2, plot=1:3, block = c("I","II"))
## specify that plot is nested in block and rep and that block is nested
## in rep
RCBD.nest <- list(plot = c("block","rep"), block="rep")
## generate treatment factor in systematic order so that its values correspond
## to plot
tr <- factor(rep(1:3, each=2, times=2))
## obtain randomized layout
RCBD.lay <- designRandomize(allocated = tr, 
                            recipient = RCBD.unit, 
                            nested.recipients = RCBD.nest, 
                            seed = 9719532, 
                            unit.permutation = TRUE)
#sort into the original standard order
RCBD.perm <- RCBD.lay[RCBD.lay$.Permutation,]
#resort into randomized order
RCBD.lay <- RCBD.perm[order(RCBD.perm$.Units),]

## generate a layout for a split-unit experiment in which: 
## - the main-unit factor is A with 4 levels arranged in 
##   a randomized complete block design with 2 blocks;
## - the split-unit factor is B with 3 levels.
SPL.lay <- designRandomize(allocated = fac.gen(list(A = 4, B = 3), times = 2), 
                           recipient = list(block = 2, main.unit = 4, split.unit = 3), 
                           nested.recipients = list(main.unit = "block", 
                                                    split.unit = c("block", "main.unit")), 
                           seed=155251978)

## Generate a permutation of Seedlings within Species
seed.permute <- designRandomize(recipient = list(Species = 3, Seedlings = 4),
                                nested.recipients = list(Seedlings = "Species"),
                                seed = 75724, except = "Species", 
                                unit.permutation = TRUE)



