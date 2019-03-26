library(polysat)


### Name: alleleDiversity
### Title: Retrieve and Count Unique Alleles
### Aliases: alleleDiversity
### Keywords: arith

### ** Examples

# generate a dataset for this example
mygen <- new("genambig", samples=c("a","b","c","d"), loci=c("E","F"))
PopInfo(mygen) <- c(1,1,2,2)
Genotypes(mygen, loci="E") <- list(c(122,132),c(122,124,140),
                                   c(124,130,132),c(132,136))
Genotypes(mygen, loci="F") <- list(c(97,99,111),c(113,115),
                                   c(99,113),c(111,115))

# look at unique alleles
myal <- alleleDiversity(mygen)
myal$counts
myal$alleles
myal$alleles[["Pop1","E"]]
myal$alleles[["overall","F"]]



