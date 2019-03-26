library(readstata13)


### Name: set.lang
### Title: Assign Stata Language Labels
### Aliases: set.lang

### ** Examples

dat <- read.dta13(system.file("extdata/statacar.dta", package="readstata13"))
get.lang(dat)
varlabel(dat)

# set German label
datDE <- set.lang(dat, "de")
get.lang(datDE)
varlabel(datDE)



