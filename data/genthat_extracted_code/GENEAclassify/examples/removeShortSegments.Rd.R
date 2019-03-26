library(GENEAclassify)


### Name: removeShortSegments
### Title: Remove Short Segments from Data
### Aliases: removeShortSegments
### Keywords: internal

### ** Examples

library(changepoint)
set.seed(45265)
tm0 <- 1001:1060
d0 <- round(c(cumsum(runif(n = 20) * 2), 
    20:1 + rnorm(n = 20), 
    runif(n = 20) * 10))  
## identify changes in variance
c0 <- cpt.var(d0, penalty = "SIC", pen.value = 1e-3, method = "PELT")
## times of changepoints
cp0 <- cpts(c0)
t0 <- c(tm0[1], tm0[sort(cp0)], tm0[60])
sdur0 <- which(diff(t0) < 10)
v0 <- param.est(c0)$variance
## Note that variance for early changepoints is low
## so they are not removed.
GENEAclassify:::removeShortSegments(shortduration = sdur0, 
    changes = cp0, 
    variance = v0, 
    time = tm0)



