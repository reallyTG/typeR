library(tolerance)


### Name: bayesnormtol.int
### Title: Bayesian Normal Tolerance Intervals
### Aliases: bayesnormtol.int
### Keywords: file

### ** Examples
 
## 95%/85% 1-sided Bayesian normal tolerance limits for 
## a sample of size 100. 

set.seed(100)
x <- rnorm(100)
out <- bayesnormtol.int(x = x, alpha = 0.05, P = 0.85, 
                        side = 1, method = "EXACT", 
                        hyper.par = list(mu.0 = 0, 
                        sig2.0 = 1, n.0 = 10, m.0 = 10))
out

plottol(out, x, plot.type = "both", side = "upper", 
        x.lab = "Normal Data")



