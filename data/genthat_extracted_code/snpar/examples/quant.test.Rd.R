library(snpar)


### Name: quant.test
### Title: Quantile Test
### Aliases: quant.test
### Keywords: quanttest

### ** Examples

# one-sample test
x <- c(14.22, 15.83, 17.74, 19.88, 20.42, 21.96, 22.33, 22.79, 23.56, 24.45)
## normal approximation test
quant.test(x, q = 19)
## exact quantile test 
quant.test(x, q = 19, exact = TRUE)

# two-sample test
y <- c(5.54, 5.52, 5.00, 4.89, 4.95, 4.85, 4.80, 4.78, 4.82, 4.85, 4.72, 4.48, 
       4.39, 4.36, 4.30, 4.26, 4.25, 4.22)
group <- as.numeric(gl(2,9))
## independent two-sample test
quant.test(y, group, exact = TRUE)
## paired two-sample test
quant.test(y,group, paired = TRUE)



