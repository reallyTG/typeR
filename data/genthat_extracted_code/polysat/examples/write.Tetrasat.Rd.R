library(polysat)


### Name: write.Tetrasat
### Title: Write Genotype Data in Tetrasat Format
### Aliases: write.Tetrasat
### Keywords: file

### ** Examples

# set up sample data (usually done by reading files)
mysamples <- c("ind1", "ind2", "ind3", "ind4")
myloci <- c("loc1", "loc2")
mygendata <- new("genambig", samples = mysamples, loci = myloci)
mygendata <- reformatPloidies(mygendata, output="one")
Usatnts(mygendata) <- c(2, 3)
Genotypes(mygendata, loci="loc1") <- list(c(202,204), c(204),
                                          c(200,206,208,212),
                                          c(198,204,208))
Genotypes(mygendata, loci="loc2") <- list(c(78,81,84),
                                          c(75,90,93,96,99),
                                          c(87), c(-9))
PopInfo(mygendata) <- c(1,2,1,2)
Description(mygendata) <- "An example for write.Tetrasat."
Ploidies(mygendata) <- 4

# write a Tetrasat file
write.Tetrasat(mygendata, file="tetrasattest.txt")

# view the file
cat(readLines("tetrasattest.txt"),sep="\n")



