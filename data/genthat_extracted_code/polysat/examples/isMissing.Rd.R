library(polysat)


### Name: isMissing
### Title: Determine Whether Genotypes Are Missing
### Aliases: isMissing
### Keywords: manip

### ** Examples

# set up a genambig object for this example
mygen <- new("genambig", samples=c("a", "b"), loci=c("locD", "locE"))
Genotypes(mygen) <- array(list(c(122, 126), c(124, 128, 134),
                               Missing(mygen), c(156, 159)),
                          dim=c(2,2))
viewGenotypes(mygen)

# test if some individual genotypes are missing
isMissing(mygen, "a", "locD")
isMissing(mygen, "a", "locE")

# test an array of genotypes
isMissing(mygen, Samples(mygen), Loci(mygen))




