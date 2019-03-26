library(mice)


### Name: nimp
### Title: Number of imputations per block
### Aliases: nimp

### ** Examples

where <- is.na(nhanes)

# standard FCS
nimp(where)

# user-defined blocks
nimp(where, blocks = name.blocks(list(c("bmi", "hyp"), "age", "chl")))



