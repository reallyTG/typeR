library(muRL)


### Name: read.murl
### Title: Read a .csv file or R dataframe of letter recipients
### Aliases: read.murl
### Keywords: IO

### ** Examples

## Specify path to .csv database of sample addresses
fpath <- system.file("extdata", "murljobs.csv", package = "muRL")

murljobs <- read.murl(fpath)



