library(auk)


### Name: read_ebd
### Title: Read an EBD file
### Aliases: read_ebd read_ebd.character read_ebd.auk_ebd read_sampling
###   read_sampling.character read_sampling.auk_ebd
###   read_sampling.auk_sampling

### ** Examples

f <- system.file("extdata/ebd-sample.txt", package = "auk")
read_ebd(f)
# read a sampling event data file
x <- system.file("extdata/zerofill-ex_sampling.txt", package = "auk") %>%
  read_sampling()



