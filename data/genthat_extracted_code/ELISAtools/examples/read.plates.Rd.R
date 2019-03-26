library(ELISAtools)


### Name: read.plates
### Title: Read the ELISA OD files
### Aliases: read.plates

### ** Examples

#get example annotation file path from the system folder
ann<-system.file("extdata", "annote.txt", package="ELISAtools")
std.conc<-system.file("extdata", "stdConc.txt", package="ELISAtools")

#read them in and there are 2 plates.
annotations<-read.annotations(annotation=ann,  std.conc=std.conc, num.plate=2)

#now start reading the OD plate file
fileName <-system.file("extdata", "Assay_3_and_4.txt", package="ELISAtools")
plates<-read.plates(fileName, annotations=annotations, num.plate=2, batchID="b1", expID="e1")




