library(PeakSegDP)


### Name: cDPA
### Title: cDPA
### Aliases: cDPA

### ** Examples

fit <- cDPA(c(0, 10, 11, 1), maxSegments=3)
stopifnot(fit$ends[3,4] == 3)
stopifnot(fit$ends[2,3] == 1)



