library(tolerance)


### Name: normtol.int
### Title: Normal (or Log-Normal) Tolerance Intervals
### Aliases: normtol.int
### Keywords: file

### ** Examples
 
## 95%/95% 2-sided normal tolerance intervals for a sample
## of size 100. 

set.seed(100)
x <- rnorm(100, 0, 0.2)
out <- normtol.int(x = x, alpha = 0.05, P = 0.95, side = 2,
                   method = "HE", log.norm = FALSE)
out

plottol(out, x, plot.type = "both", side = "two", 
        x.lab = "Normal Data")



