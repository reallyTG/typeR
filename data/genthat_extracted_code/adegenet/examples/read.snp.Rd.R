library(adegenet)


### Name: read.snp
### Title: Reading Single Nucleotide Polymorphism data
### Aliases: read.snp
### Keywords: manip

### ** Examples


## Not run: 
##D ## show the example file ##
##D ## this is the path to the file:
##D system.file("files/exampleSnpDat.snp",package="adegenet")
##D 
##D ## show its content:
##D file.show(system.file("files/exampleSnpDat.snp",package="adegenet"))
##D 
##D 
##D ## read the file
##D obj <-
##D read.snp(system.file("files/exampleSnpDat.snp",package="adegenet"), chunk=2)
##D obj
##D as.matrix(obj)
##D ploidy(obj)
##D alleles(obj)
##D locNames(obj)
## End(Not run)




