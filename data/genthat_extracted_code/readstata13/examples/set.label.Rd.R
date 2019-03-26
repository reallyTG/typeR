library(readstata13)


### Name: set.label
### Title: Assign Stata Labels to a Variable
### Aliases: set.label

### ** Examples

dat <- read.dta13(system.file("extdata/statacar.dta", package="readstata13"),
                  convert.factors=FALSE)

# compare vectors
set.label(dat, "type")
dat$type

# German label
set.label(dat, "type", "de")



