library(Repliscope)


### Name: loadBed
### Title: Load a BED formatted file.
### Aliases: loadBed
### Keywords: BED bioinformatics genomics

### ** Examples

W303_G2 <- loadBed(system.file("extdata/W303_G2.bed",package="Repliscope"), name='W303_G2')
W303_G2_chrI <- loadBed(system.file("extdata/W303_G2.bed",package="Repliscope"),
                       name='W303_G2',genome=sacCer3[["genome"]])



