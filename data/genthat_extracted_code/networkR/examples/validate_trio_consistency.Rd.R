library(networkR)


### Name: validate_trio_consistency
### Title: Validate pedigree trio information consistency
### Aliases: validate_trio_consistency
### Keywords: manip

### ** Examples


library("data.table")
id <- 1:12
fid <- c(NA,  0, 1, 1, NA, 23, 45, 5, 5, 7, 10, 10)
mid <- c(NA, NA, 2, 2,  0, 56, 46, 6, 6, 6, 9, 11)

validate_trio_consistency(id, fid, mid)




