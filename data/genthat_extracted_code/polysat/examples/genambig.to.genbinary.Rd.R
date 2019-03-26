library(polysat)


### Name: genambig.to.genbinary
### Title: Convert Between Genotype Object Classes
### Aliases: genambig.to.genbinary genbinary.to.genambig
### Keywords: manip

### ** Examples

# set up a genambig object for this example
mygen <- new("genambig", samples = c("A", "B", "C", "D"),
             loci = c("locJ", "locK"))
PopNames(mygen) <- c("PopQ", "PopR")
PopInfo(mygen) <- c(1,1,2,2)
Usatnts(mygen) <- c(2,2)
Genotypes(mygen, loci="locJ") <- list(c(178, 184, 186), c(174,186),
                                      c(182, 188, 190),
                                      c(182, 184, 188))
Genotypes(mygen, loci="locK") <- list(c(133, 135, 141),
                                      c(131, 135, 137, 143),
                                      Missing(mygen), c(133, 137))

# convert it to a genbinary object
mygenB <- genambig.to.genbinary(mygen)

# check the results
viewGenotypes(mygenB)
viewGenotypes(mygen)
PopInfo(mygenB)

# convert back to a genambig object
mygenA <- genbinary.to.genambig(mygenB)
viewGenotypes(mygenA)

# note: identical(mygen, mygenA) returns FALSE, because the alleles
# origninally input are not stored as integers, while the alleles
# produced by genbinary.to.genambig are integers.

  


