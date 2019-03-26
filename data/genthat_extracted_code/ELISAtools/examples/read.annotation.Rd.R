library(ELISAtools)


### Name: read.annotation
### Title: Read the annotation of single ELISA plate
### Aliases: read.annotation

### ** Examples

#get example annotation file path from the system folder
fileName<-system.file("extdata", "annote_single.txt", package="ELISAtools")
#prepare the standard concentration file.
std.conc<-data.frame(id=c("s1","s2","s3","s4","s5","s6"), conc=c(1:6))
#read the data as a data frame.
ann<-read.table(fileName, header=TRUE,  sep="\t", stringsAsFactors=FALSE)

#call to do the reading.



