library(BENMMI)


### Name: ci_mean
### Title: Mean and Confidence Interval
### Aliases: ci_mean

### ** Examples

     stopifnot(all.equal(ci_mean(NA_real_), c(NA_real_, NA_real_, NA_real_)))
     stopifnot(all.equal(ci_mean(1), c(lower = NA_real_, mean = 1, upper = NA_real_)))
     stopifnot(all.equal(
         ci_mean(1:9, 0.95),
         c(lower = 2.934942, mean = 5.000000, upper = 7.065058), 
         tolerance = 0.0001)
     )
     



