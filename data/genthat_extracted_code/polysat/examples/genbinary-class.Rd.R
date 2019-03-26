library(polysat)


### Name: genbinary-class
### Title: Class "genbinary"
### Aliases: genbinary-class Absent,genbinary-method
###   Absent<-,genbinary-method Genotype,genbinary-method
###   Genotypes,genbinary-method Genotypes<-,genbinary-method
###   initialize,genbinary-method Missing<-,genbinary-method
###   Present,genbinary-method Present<-,genbinary-method
###   Samples<-,genbinary-method Loci<-,genbinary-method
###   isMissing,genbinary-method summary,genbinary-method
###   editGenotypes,genbinary-method viewGenotypes,genbinary-method
###   deleteSamples,genbinary-method deleteLoci,genbinary-method
###   [,genbinary-method estimatePloidy,genbinary-method
### Keywords: classes

### ** Examples

# show the class definition
showClass("genbinary")

# create a genbinary object
mygen <- new("genbinary", samples = c("indA", "indB", "indC", "indD"),
             loci = c("loc1", "loc2"))
Description(mygen) <- "Example genbinary object for the documentation."
Usatnts(mygen) <- c(2,3)
PopNames(mygen) <- c("Maine", "Indiana")
PopInfo(mygen) <- c(1,1,2,2)
Genotypes(mygen) <- matrix(c(1,1,0,0, 1,0,0,1, 0,0,1,1,
                             1,-9,1,0, 0,-9,0,1, 1,-9,0,1, 0,-9,1,1),
   nrow=4, ncol=7, dimnames = list(NULL,
   c("loc1.140", "loc1.144", "loc1.150",
     "loc2.97", "loc2.100", "loc2.106", "loc2.109")))

# view all of the data in the object
mygen



