library(adegenet)


### Name: fasta2genlight
### Title: Extract Single Nucleotide Polymorphism (SNPs) from alignments
### Aliases: fasta2genlight
### Keywords: manip

### ** Examples

## Not run: 
##D ## show the example file ##
##D ## this is the path to the file:
##D myPath <- system.file("files/usflu.fasta",package="adegenet")
##D myPath
##D 
##D ## read the file
##D obj <- fasta2genlight(myPath, chunk=10) # process 10 sequences at a time
##D obj
##D 
##D ## look at extracted information
##D position(obj)
##D alleles(obj)
##D locNames(obj)
##D 
##D ## plot positions of polymorphic sites
##D temp <- density(position(obj), bw=10)
##D plot(temp, xlab="Position in the alignment", lwd=2, main="Location of the SNPs")
##D points(position(obj), rep(0, nLoc(obj)), pch="|", col="red")
## End(Not run)



