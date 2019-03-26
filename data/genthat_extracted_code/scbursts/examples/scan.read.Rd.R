library(scbursts)


### Name: scan.read
### Title: Read a scan results text file. scan.read returns a 1 segment
###   list Reads in scan results and puts them in the same format as the
###   output of dwt.read. See 'dwt', and 'segment' for more information.
### Aliases: scan.read

### ** Examples


infile <- system.file("extdata", "example1_scan.txt", package = "scbursts")
record <- scan.read(infile)
head(record)




