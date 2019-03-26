library(assertable)


### Name: assert_colnames
### Title: Assert that a data.frame contains specified column names
### Aliases: assert_colnames

### ** Examples

assert_colnames(CO2, c("Plant","Type","Treatment","conc","uptake"))
assert_colnames(CO2, c("Plant","Type"), only_colnames=FALSE)



