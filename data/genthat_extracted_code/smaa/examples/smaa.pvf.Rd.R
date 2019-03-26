library(smaa)


### Name: smaa.pvf
### Title: Compute piece-wise linear partial value functions
### Aliases: smaa.pvf

### ** Examples

x <- c(50, 90, 100, 10, 40, 101, 120)
values <- smaa.pvf(x,
  cutoffs=c(50, 75, 90, 100),
  values=c(1, 0.8, 0.5, 0),
  outOfBounds="clip")
stopifnot(all.equal(values, c(1.0, 0.5, 0.0, 1.0, 1.0, 0.0, 0.0)))



