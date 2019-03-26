library(readstata13)


### Name: get.label
### Title: Get Stata Label Table for a Label Set
### Aliases: get.label

### ** Examples

dat <- read.dta13(system.file("extdata/statacar.dta", package="readstata13"))
labname <- get.label.name(dat,"type")
get.label(dat, labname)



