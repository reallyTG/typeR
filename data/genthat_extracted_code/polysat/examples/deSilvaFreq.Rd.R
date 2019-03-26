library(polysat)


### Name: deSilvaFreq
### Title: Estimate Allele Frequencies with EM Algorithm
### Aliases: deSilvaFreq
### Keywords: array iteration

### ** Examples

## Not run: 
##D ## An example with a long run time due to the number of alleles
##D 
##D # create a dataset for this example
##D mygen <- new("genambig", samples=c(paste("A", 1:100, sep=""),
##D                                    paste("B", 1:100, sep="")),
##D              loci=c("loc1", "loc2"))
##D PopNames(mygen) <- c("PopA", "PopB")
##D PopInfo(mygen) <- c(rep(1, 100), rep(2, 100))
##D mygen <- reformatPloidies(mygen, output="one")
##D Ploidies(mygen) <- 4
##D Usatnts(mygen) <- c(2, 2)
##D Description(mygen) <- "An example for allele frequency calculation."
##D 
##D # create some genotypes at random for this example
##D for(s in Samples(mygen)){
##D     Genotype(mygen, s, "loc1") <- sample(seq(120, 140, by=2),
##D                                          sample(1:4, 1))
##D }
##D for(s in Samples(mygen)){
##D     Genotype(mygen, s, "loc2") <- sample(seq(130, 156, by=2),
##D                                          sample(1:4, 1))
##D }
##D # make one genotype missing
##D Genotype(mygen, "B4", "loc2") <- Missing(mygen)
##D 
##D # view the dataset
##D summary(mygen)
##D viewGenotypes(mygen)
##D 
##D # calculate the allele frequencies if the rate of selfing is 0.2
##D myfrequencies <- deSilvaFreq(mygen, self=0.2)
##D 
##D # view the results
##D myfrequencies
## End(Not run)

## An example with a shorter run time, for checking that the funciton
## is working.  Genotype simulation is also a bit more realistic here.

# Create a dataset for the example.
mygen <- new("genambig", samples=paste("A", 1:100, sep=""), loci="loc1")
PopNames(mygen) <- "PopA"
PopInfo(mygen) <- rep(1, 100)
mygen <- reformatPloidies(mygen, output="one")
Ploidies(mygen) <- 4
Usatnts(mygen) <- 2
for(s in Samples(mygen)){
    alleles <- unique(sample(c(122,124,126,0), 4, replace=TRUE,
                             prob = c(0.3, 0.2, 0.4, 0.1)))
    Genotype(mygen, s, "loc1") <- alleles[alleles != 0]
    if(length(Genotype(mygen, s, "loc1"))==0)
        Genotype(mygen, s, "loc1") <- Missing(mygen)
}

# We have created a random mating populations with four alleles
# including one null.  The allele frequencies are given in the
# 'prob' argument.

# Estimate allele frequencies
myfreq <- deSilvaFreq(mygen, self=0.01)
myfreq



