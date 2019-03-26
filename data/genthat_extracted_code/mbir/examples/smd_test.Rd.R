library(mbir)


### Name: smd_test
### Title: Standardized Mean Difference Test
### Aliases: smd_test

### ** Examples

a <- rnorm(25, 80, 35)
b <- rnorm(25, 100, 50)

smd_test(a, b, paired = FALSE, conf.int=0.95)



