library(scanstatistics)


### Name: flexible_zones
### Title: Computes the flexibly shaped zones as in Tango (2005).
### Aliases: flexible_zones

### ** Examples

A <- matrix(c(0,1,0,0,0,0,
              1,0,1,0,0,0,
              0,1,0,0,0,0,
              0,0,0,0,1,0,
              0,0,0,1,0,0,
              0,0,0,0,0,0), 
              nrow = 6, byrow = TRUE) == 1
nn <- matrix(as.integer(c(1,2,3,4,5,6,
                          2,1,3,4,5,6,
                          3,2,1,4,5,6,
                          4,5,1,6,3,2,
                          5,4,6,1,3,2,
                          6,5,4,1,3,2)),
                          nrow = 6, byrow = TRUE)
flexible_zones(nn, A)



