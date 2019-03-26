library(GENEAclassify)


### Name: degrees
### Title: Extract rotation time series
### Aliases: degrees
### Keywords: internal

### ** Examples

   d1 <- matrix(c(100, 101, -0.79, -0.86, -0.17, -0.14, 0.53, 0.46), 
        nrow = 2, ncol = 4)
   colnames(d1) <- c("timestamp", "x", "y", "z")
   degrees(x = d1)



