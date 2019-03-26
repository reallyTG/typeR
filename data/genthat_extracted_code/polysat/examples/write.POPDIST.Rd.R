library(polysat)


### Name: write.POPDIST
### Title: Write Genotypes to a POPDIST File
### Aliases: write.POPDIST
### Keywords: file

### ** Examples

# create a "genambig" object containing the dataset
mygen <- new("genambig", samples=c("a", "b", "c", "d"),
             loci=c("loc1", "loc27"))
mygen <- reformatPloidies(mygen, output="sample")
Description(mygen) <- "Some example data for POPDIST"
PopInfo(mygen) <- c(1,1,2,2)
PopNames(mygen) <- c("Old Orchard Beach", "York Beach")
Ploidies(mygen) <- c(2,2,4,4)
Usatnts(mygen) <- c(2,2)
Genotypes(mygen, loci="loc1") <- list(c(128, 134), c(130),
                                      Missing(mygen), c(126, 128, 132))
Genotypes(mygen, loci="loc27") <- list(c(209,211), c(207,217),
                                       c(207,209,215,221), c(211,223))

# write the file
write.POPDIST(mygen, file="forPOPDIST.txt")

# view the file
cat(readLines("forPOPDIST.txt"), sep="\n")




