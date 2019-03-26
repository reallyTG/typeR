library(polysat)


### Name: estimatePloidy
### Title: Estimate Ploidies Based on Allele Counts
### Aliases: estimatePloidy
### Keywords: arith methods

### ** Examples

if(interactive()){ #this line included for automated checking on CRAN

# create a dataset for this example
mygen <- new("genambig", samples=c("a", "b", "c"),
             loci=c("loc1", "loc2"))
Genotypes(mygen, loci="loc1") <- list(c(122, 126, 128), c(124, 130),
                                      c(120, 122, 124))
Genotypes(mygen, loci="loc2") <- list(c(140, 148), c(144, 150), Missing(mygen))

# estimate the ploidies
mygen <- estimatePloidy(mygen)

# view the ploidies
Ploidies(mygen)

}




