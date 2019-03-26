library(tolerance)


### Name: mvregtol.region
### Title: Multivariate (Multiple) Linear Regression Tolerance Regions
### Aliases: mvregtol.region
### Keywords: file

### ** Examples
 
## 95%/95% multivariate regression tolerance factors using
## a fertilizer data set presented in Anderson (2003, p. 374). 

grain <- c(40, 17, 9, 15, 6, 12, 5, 9)
straw <- c(53, 19, 10, 29, 13, 27, 19, 30)
fert <- c(24, 11, 5, 12, 7, 14, 11, 18)
Y <- cbind(grain, straw)
X <- cbind(fert)
new.x <- c(10, 15, 20)

set.seed(100)
out <- mvregtol.region(Y, X, new.x, int = TRUE, alpha = 0.05,
                       P = 0.95, B = 5000)
out



