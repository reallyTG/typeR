library(cepreader)


### Name: readCEP
### Title: Reads a CEP (Canoco) data file
### Aliases: readCEP
### Keywords: IO file

### ** Examples

## classic example
cepfile <- file.path(path.package("cepreader"), "testdata", "dune.spe")
## peak at the file structure
head(readLines(cepfile), n=10)
tail(readLines(cepfile), n=10)
## as a data frame
readCEP(cepfile)



