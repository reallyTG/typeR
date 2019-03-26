library(readstata13)


### Name: get.origin.codes
### Title: Get Origin Code Numbers for Factors
### Aliases: get.origin.codes

### ** Examples

dat <- read.dta13(system.file("extdata/statacar.dta", package="readstata13"))
labname <- get.label.name(dat,"type")
labtab <- get.label(dat, labname)

# comparsion
get.origin.codes(dat$type, labtab)
as.integer(dat$type)



