library(polysat)


### Name: write.Structure
### Title: Write Genotypes in Structure 2.3 Format
### Aliases: write.Structure
### Keywords: file

### ** Examples

# input genotype data (this is usually done by reading a file)
mygendata <- new("genambig", samples = c("ind1","ind2","ind3",
                                         "ind4","ind5","ind6"),
                 loci = c("locus1","locus2"))
Genotypes(mygendata) <- array(list(c(100,102,106,108,114,118),c(102,110),
                      c(98,100,104,108,110,112,116),c(102,106,112,118),
                      c(104,108,110),c(-9),
                      c(204),c(206,208,210,212,220,224,226),
                      c(202,206,208,212,214,218),c(200,204,206,208,212),
                      c(-9),c(202,206)),
                 dim=c(6,2))
Ploidies(mygendata) <- c(6,6,6,4,4,4)
# Note that some of the above genotypes have more or fewer alleles than
# the ploidy of the sample.

# create a vector of sample names to be used.  Note that this excludes
#  ind6.
mysamples <- c("ind1","ind2","ind3","ind4","ind5")

# Create an array containing data for additional columns to be written
# to the file.  You might also prefer to just read this and the ploidies
# in from a file.
myexcols <- array(data=c(1,2,1,2,1,1,1,0,0,0),dim=c(5,2),
                  dimnames=list(mysamples, c("PopData","PopFlag")))

# Write the Structure file, with six rows per individual.
# Since outfile="", the data will be written to the console instead of a file.
write.Structure(mygendata, 6, "", samples = mysamples, writepopinfo = FALSE,
                extracols = myexcols)



