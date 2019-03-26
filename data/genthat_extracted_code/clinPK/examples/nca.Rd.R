library(clinPK)


### Name: nca
### Title: Perform an NCA based on a NONMEM-style dataset
### Aliases: nca

### ** Examples

data <- data.frame(time = c(0, 2, 4, 6, 8, 12, 16),
                   dv   = c(0, 10, 14, 11, 9, 5, 1.5))
nca(data)



