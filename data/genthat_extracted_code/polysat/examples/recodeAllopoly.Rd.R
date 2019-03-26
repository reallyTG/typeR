library(polysat)


### Name: recodeAllopoly
### Title: Create a New 'genambig' Dataset with Loci Split into Isoloci
### Aliases: recodeAllopoly
### Keywords: manip

### ** Examples

# generate a dataset for this example
testdata <- new("genambig", samples = paste("S", 1:9, sep = ""),
                loci = c("L1", "L2","L3"))
Genotypes(testdata, loci="L1") <-
    list(c(120,124),c(124,126,130),c(120,126),c(126,132,134),
         c(120,124,130,132),c(120,126,130),c(120,132,134),
         c(120,124,126,130),c(120,132,138))
Genotypes(testdata, loci="L2") <-
    list(c(210,219,222,225),c(216,228),c(210,213,219,222),c(213,222,225,228),
         c(210,213,216,219),c(222,228),c(213),c(210,216),c(219,222,228))
Genotypes(testdata, loci="L3") <-
    list(c(155,145,153),c(157,155),c(151,157,159,165),c(147,151),c(149,153,157),
         c(149,157),c(153,159,161),c(163,165),c(147,163,167))
viewGenotypes(testdata)

# generate allele assignments for this example
myAssign <- list(list(locus="L1", SGploidy=2,
             assignments=matrix(c(1,0,0,1,1,1,0,1,1,0,1,1), nrow=2,
                                ncol=6, dimnames=list(NULL,
                                  c("120","124","126","130","132","134")))),
    list(locus="L2", SGploidy=2,
         assignments=matrix(c(1,1,1,1,1,1,1,0,1,0,1,0,0,1), nrow=2, ncol=7,
    dimnames=list(NULL,c("210","213","216","219","222","225","228")))),
    list(locus="L3", SGploidy=2, assignments="No assignment"))
myAssign

# recode the dataset
splitdata <- recodeAllopoly(testdata, myAssign)

# view results
viewGenotypes(splitdata)
Ploidies(splitdata)




