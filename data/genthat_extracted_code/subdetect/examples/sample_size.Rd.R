library(subdetect)


### Name: sample_size
### Title: Calculate Required Sample Size for the Test on Subgroup
###   Existence.
### Aliases: sample_size

### ** Examples

model <- ~ x1
theta0 <- c("(Intercept)" = 0.0, "x1" = 1.0)
sample_size(outcome = ~ x1,
            theta0 = theta0,
            N = 1000,
            sigma2 = 0.25,
            tau = 0.25,
            K = 100, 
            M = 1000,
            x1 = list(FUN=runif, min = -1, max = 1))



