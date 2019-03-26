library(polysat)


### Name: deleteSamples
### Title: Remove Samples or Loci from an Object
### Aliases: deleteSamples deleteLoci
### Keywords: manip

### ** Examples

# set up genambig object
mygen <- new("genambig", samples = c("ind1", "ind2", "ind3", "ind4"),
             loci = c("locA", "locB", "locC", "locD"))

# delete a sample
Samples(mygen)
mygen <- deleteSamples(mygen, "ind1")
Samples(mygen)

# delete some loci
Loci(mygen)
mygen <- deleteLoci(mygen, c("locB", "locC"))
Loci(mygen)



