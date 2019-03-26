library(RDS)


### Name: read.rdsat
### Title: Import data from the 'RDSAT' format as an 'rds.data.frame'
### Aliases: read.rdsat

### ** Examples

fn <- paste0(path.package("RDS"),"/extdata/nyjazz.rdsat")
rd <- read.rdsat(fn)
plot(rd)



