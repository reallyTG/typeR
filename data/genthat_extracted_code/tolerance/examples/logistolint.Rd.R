library(tolerance)


### Name: logistol.int
### Title: Logistic (or Log-Logistic) Tolerance Intervals
### Aliases: logistol.int
### Keywords: file

### ** Examples
 
## 90%/95% 1-sided logistic tolerance intervals for a sample
## of size 20. 

set.seed(100)
x <- rlogis(20, 5, 1)
out <- logistol.int(x = x, alpha = 0.10, P = 0.95, 
                    log.log = FALSE, side = 1) 
out

plottol(out, x, plot.type = "control", side = "two", 
        x.lab = "Logistic Data")



