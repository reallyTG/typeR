library(polysat)


### Name: write.SPAGeDi
### Title: Write Genotypes in SPAGeDi Format
### Aliases: write.SPAGeDi
### Keywords: file

### ** Examples

# set up data to write (usually read from a file)
mygendata <- new("genambig", samples = c("ind1","ind2","ind3","ind4"),
                 loci = c("loc1", "loc2"))
mygendata <- reformatPloidies(mygendata, output="sample")
Genotypes(mygendata, samples="ind1") <- list(c(102,106,108),c(207,210))
Genotypes(mygendata, samples="ind2") <- list(c(104),c(204,210))
Genotypes(mygendata, samples="ind3") <- list(c(100,102,108),c(201,213))
Genotypes(mygendata, samples="ind4") <- list(c(102,112),c(-9))
Ploidies(mygendata) <- c(3,2,2,2)
Usatnts(mygendata) <- c(2,3)
PopNames(mygendata) <- c("A", "B")
PopInfo(mygendata) <- c(1,1,2,2)
myspatcoord <- data.frame(X=c(27,29,24,30), Y=c(44,41,45,46),
                          row.names=c("ind1","ind2","ind3","ind4"))

# write a file
write.SPAGeDi(mygendata, spatcoord = myspatcoord,
              file="SpagOutExample.txt")



