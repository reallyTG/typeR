library(ncdf4.helpers)


### Name: nc.is.regular.dimension
### Title: Determine if a dimension is regular
### Aliases: nc.is.regular.dimension

### ** Examples

dat <- c(1, 2, 3, 4, 5, 6, 7)
## TRUE
nc.is.regular.dimension(dat)

dat[7] <- 7.001
## FALSE
nc.is.regular.dimension(dat)



