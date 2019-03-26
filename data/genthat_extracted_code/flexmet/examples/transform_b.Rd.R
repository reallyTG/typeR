library(flexmet)


### Name: transform_b
### Title: Transform FMP Item Parameters
### Aliases: transform_b inv_transform_b

### ** Examples


## example parameters from Table 7 of Reise & Waller (2003)
## goal: transform IRT model to sum score metric

a <- c(0.57, 0.68, 0.76, 0.72, 0.69, 0.57, 0.53, 0.64,
       0.45, 1.01, 1.05, 0.50, 0.58, 0.58, 0.60, 0.59,
       1.03, 0.52, 0.59, 0.99, 0.95, 0.39, 0.50)
b <- c(0.87, 1.02, 0.87, 0.81, 0.75, -0.22, 0.14, 0.56,
       1.69, 0.37, 0.68, 0.56, 1.70, 1.20, 1.04, 1.69,
       0.76, 1.51, 1.89, 1.77, 0.39, 0.08, 2.02)

## convert from difficulties and discriminations to FMP parameters

b1 <- 1.702 * a
b0 <- - 1.702 * a * b
bmat <- cbind(b0, b1)

## theta transformation vector (k_theta = 3)
##  see vignette for details about how to find tvec

tvec <- c(-3.80789e+00, 2.14164e+00, -6.47773e-01, 1.17182e-01,
          -1.20807e-02, 7.02295e-04, -2.13809e-05, 2.65177e-07)

## transform bmat
bstarmat <- t(apply(bmat, 1, transform_b, tvec = tvec))

## inspect transformed parameters
signif(head(bstarmat), 2)

## plot test response function
##  should be a straight line if transformation worked

curve(rowSums(irf_fmp(x, bmat = bstarmat)), xlim = c(0, 23),
      ylim = c(0, 23), xlab = expression(paste(theta,"*")),
      ylab = "Expected Sum Score")
abline(0, 1, col = 2)




