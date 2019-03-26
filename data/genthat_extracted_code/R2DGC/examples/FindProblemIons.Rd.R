library(R2DGC)


### Name: FindProblemIons
### Title: This function scans over a range of potential ions and looks for
###   ions that are not present in any peak or are common enough to
###   decrease alignment quality. Can use as input to the consensus align
###   function to avoid including these ions during alignment to speed up
###   processing time and improve alignments
### Aliases: FindProblemIons

### ** Examples

FindProblemIons(inputFile=system.file("extdata", "SampleA.txt", package="R2DGC"),
    possibleIons = 70:78,plotData=FALSE)




