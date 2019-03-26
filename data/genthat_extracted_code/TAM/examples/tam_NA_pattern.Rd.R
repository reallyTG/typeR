library(TAM)


### Name: tam_NA_pattern
### Title: Missing Data Patterns
### Aliases: tam_NA_pattern tam_01_pattern

### ** Examples

#############################################################################
# EXAMPLE 1: Missing data patterns
#############################################################################

data(data.sim.rasch.missing, package="TAM")
dat <- data.sim.rasch.missing

res <- TAM::tam_NA_pattern(dat)
str(res)

#############################################################################
# EXAMPLE 2: Item response patterns
#############################################################################

data(data.read, package="sirt")
dat <- data.read

res <- TAM::tam_01_pattern(dat)
str(res)



