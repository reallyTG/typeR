library(BIOdry)


### Name: rtimes
### Title: Time-units synchronization
### Aliases: rtimes

### ** Examples

## row names of a vector
fy <- function(y,span){(y - span):y}
x <- c(fy(2005,5),fy(2007,10)) 
## (not run) Simulating the vector
r <- abs(rnorm(length(x)))
names(r) <- x
## (not run) computing the synchronized times:
rtimes(r,only.dup = TRUE)        
## (not run) Extracting only duplicated times:
na.omit(rtimes(r,only.dup = TRUE))



