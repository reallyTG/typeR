library(polysat)


### Name: simpleFreq
### Title: Simple Allele Frequency Estimator
### Aliases: simpleFreq
### Keywords: arith

### ** Examples

# create a data set for this example
mygen <- new("genambig", samples = paste("ind", 1:6, sep=""),
             loci = c("loc1", "loc2"))
mygen <- reformatPloidies(mygen, output="sample")
Genotypes(mygen, loci="loc1") <- list(c(206),c(208,210),c(204,206,210),
    c(196,198,202,208),c(196,200),c(198,200,202,204))
Genotypes(mygen, loci="loc2") <- list(c(130,134),c(138,140),c(130,136,140),
    c(138),c(136,140),c(130,132,136))
PopInfo(mygen) <- c(1,1,1,2,2,2)
Ploidies(mygen) <- c(2,2,4,4,2,4)

# calculate allele frequencies
myfreq <- simpleFreq(mygen)

# look at the results
myfreq

# an example where ploidy is indexed by locus instead
mygen2 <- new("genambig", samples = paste("ind", 1:6, sep=""),
             loci = c("loc1", "loc2"))
mygen2 <- reformatPloidies(mygen2, output="locus")
PopInfo(mygen2) <- 1
Ploidies(mygen2) <- c(2,4)
Genotypes(mygen2, loci="loc1") <- list(c(198), c(200,204), c(200),
                                       c(198,202), c(200), c(202,204))
Genotypes(mygen2, loci="loc2") <- list(c(140,144,146), c(138,144),
                                       c(136,138,144,148), c(140),
                                       c(140,142,146,150),
                                       c(142,148,150))
myfreq2 <- simpleFreq(mygen2)
myfreq2



