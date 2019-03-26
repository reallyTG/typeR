library(polysat)


### Name: write.ATetra
### Title: Write Genotypes in ATetra Format
### Aliases: write.ATetra
### Keywords: file

### ** Examples

# set up sample data (usually done by reading files)
mysamples <- c("ind1", "ind2", "ind3", "ind4")
myloci <- c("loc1", "loc2")
mygendata <- new("genambig", samples=mysamples, loci=myloci)
mygendata <- reformatPloidies(mygendata, output="one")
Genotypes(mygendata, loci="loc1") <- list(c(202,204), c(204),
                                          c(200,206,208,212),
                                          c(198,204,208))
Genotypes(mygendata, loci="loc2") <- list(c(78,81,84),
                                          c(75,90,93,96,99),
                                          c(87), c(-9))
PopInfo(mygendata) <- c(1,2,1,2)
PopNames(mygendata) <- c("this pop", "that pop")
Ploidies(mygendata) <- 4
Description(mygendata) <- "Example for write.ATetra."

# write an ATetra file
write.ATetra(mygendata, file="atetratest.txt")

# view the file
cat(readLines("atetratest.txt"),sep="\n")




