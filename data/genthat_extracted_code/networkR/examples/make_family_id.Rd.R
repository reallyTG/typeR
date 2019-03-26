library(networkR)


### Name: make_family_id
### Title: Construct family id vector from pedigree trio information
### Aliases: make_family_id
### Keywords: manip

### ** Examples


id <- 1:11
fid <- c(NA, NA, 1, 1, NA, 23, 45, 5, 5, 7, NA)
mid <- c(NA, NA, 2, 2, 65, NA, 46, 6, 6, 6, 0)
make_family_id(id, fid, mid)




