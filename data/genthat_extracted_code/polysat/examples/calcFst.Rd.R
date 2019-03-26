library(polysat)


### Name: calcPopDiff
### Title: Estimate Population Differentiation Statistics
### Aliases: calcFst calcPopDiff
### Keywords: arith array

### ** Examples

# create a data set (typically done by reading files)
mygenotypes <- new("genambig", samples = paste("ind", 1:6, sep=""),
                   loci = c("loc1", "loc2"))
Genotypes(mygenotypes, loci = "loc1") <- list(c(206), c(208,210),
                                              c(204,206,210),
    c(196,198,202,208), c(196,200), c(198,200,202,204))
Genotypes(mygenotypes, loci = "loc2") <- list(c(130,134), c(138,140),
                                              c(130,136,140),
    c(138), c(136,140), c(130,132,136))
PopInfo(mygenotypes) <- c(1,1,1,2,2,2)
mygenotypes <- reformatPloidies(mygenotypes, output="sample")
Ploidies(mygenotypes) <- c(2,2,4,4,2,4)
Usatnts(mygenotypes) <- c(2,2)

# calculate allele frequencies
myfreq <- simpleFreq(mygenotypes)

# calculate pairwise differentiation statistics
myfst <- calcPopDiff(myfreq, metric = "Fst")
mygst <- calcPopDiff(myfreq, metric = "Gst")
myD <- calcPopDiff(myfreq, metric = "Jost's D")
myrst <- calcPopDiff(myfreq, metric = "Rst", object = mygenotypes)

# examine the results
myfst
mygst
myD
myrst

# get global statistics
calcPopDiff(myfreq, metric = "Fst", global = TRUE)
calcPopDiff(myfreq, metric = "Gst", global = TRUE)
calcPopDiff(myfreq, metric = "Jost's D", global = TRUE)
calcPopDiff(myfreq, metric = "Rst", global = TRUE, object = mygenotypes)



