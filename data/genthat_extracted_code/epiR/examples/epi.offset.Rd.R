library(epiR)


### Name: epi.offset
### Title: Create offset vector
### Aliases: epi.offset
### Keywords: univar univar

### ** Examples

dat <- c(1,1,1,2,2,2,2,3,3,3)
dat <- as.factor(dat)

offset <- epi.offset(dat)
offset
## [1] 1 4 8 10




