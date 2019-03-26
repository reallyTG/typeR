library(updog)


### Name: flexdog_full
### Title: Flexible genotyping for polyploids from next-generation
###   sequencing data.
### Aliases: flexdog_full

### ** Examples

## A natural population. We will assume a
## normal prior since there are so few
## individuals.
data("uitdewilligen")
ploidy  <- 4
refvec  <- uitdewilligen$refmat[, 1]
sizevec <- uitdewilligen$sizemat[, 1]
fout    <- flexdog_full(refvec  = refvec,
                        sizevec = sizevec,
                        ploidy  = ploidy,
                        model   = "norm")
plot(fout)




