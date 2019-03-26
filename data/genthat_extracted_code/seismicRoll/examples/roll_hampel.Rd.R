library(seismicRoll)


### Name: roll_hampel
### Title: Rolling Hampel Filter for Outlier Detection
### Aliases: roll_hampel

### ** Examples

a <- sin(0.1*seq(100))
a[20] <- 50

b <- roll_hampel(a,10)
threshold <- 6
which(b > threshold)

## Not run: 
##D   require(microbenchmark)
##D   require(pracma)
##D   
##D   microbenchmark(hampel(a,10), roll_hampel(a,10), times=10)
##D   
##D   #  Unit: microseconds
##D   #                 expr      min       lq    median       uq       max neval
##D   #        hampel(a, 10) 7610.688 7784.374 8037.4035 9453.928 16176.535    10
##D   #   roll_hampel(a, 10)   36.530   37.443   58.7165   65.418    90.403    10
## End(Not run)



