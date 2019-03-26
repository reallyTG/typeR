library(polysat)


### Name: read.GeneMapper
### Title: Read GeneMapper Genotypes Tables
### Aliases: read.GeneMapper
### Keywords: file

### ** Examples

# create a table of data
gentable <- data.frame(Sample.Name=rep(c("ind1","ind2","ind3"),2),
                       Marker=rep(c("loc1","loc2"), each=3),
                       Allele.1=c(202,200,204,133,133,130),
                       Allele.2=c(206,202,208,136,142,136),
                       Allele.3=c(NA,208,212,145,148,NA),
                       Allele.4=c(NA,216,NA,151,157,NA)
                       )
# create a file (inspect this file in a text editor or spreadsheet
# software to see the required format)
write.table(gentable, file="readGMtest.txt", quote=FALSE, sep="\t",
            na="", row.names=FALSE, col.names=TRUE)

# read the file
mygenotypes <- read.GeneMapper("readGMtest.txt")

# inspect the results
viewGenotypes(mygenotypes)



