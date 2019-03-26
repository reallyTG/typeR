library(NostalgiR)


### Name: nos.qqnorm
### Title: nos.qqnorm text-based normal quantile-quantile plots
### Aliases: nos.qqnorm

### ** Examples

## Produce a normal quantile-quantile plot of 10 random standard normal points,
## without the line of theoretical quantile equality.
data <- rnorm(10)
nos.qqnorm(data,line=FALSE)

## Produce a normal quantile-quantile plot of 100 random chi-squared(3) points,
## with the line of theoretical quantile equality.
data <- rchisq(100,3)
nos.qqnorm(data)



