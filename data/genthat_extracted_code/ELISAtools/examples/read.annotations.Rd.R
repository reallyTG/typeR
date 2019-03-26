library(ELISAtools)


### Name: read.annotations
### Title: Read the annotations of plates
### Aliases: read.annotations

### ** Examples

#get example annotation file path from the system folder
ann<-system.file("extdata", "annote.txt", package="ELISAtools")
std.conc<-system.file("extdata", "stdConc.txt", package="ELISAtools")

#read them in and there are 2 plates.
read.annotations(annotation=ann,  std.conc=std.conc, num.plate=2)



