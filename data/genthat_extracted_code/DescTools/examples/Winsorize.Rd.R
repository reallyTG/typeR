library(DescTools)


### Name: Winsorize
### Title: Winsorize (Replace Extreme Values by Less Extreme Ones)
### Aliases: Winsorize
### Keywords: univar robust

### ** Examples

## generate data
set.seed(1234)     # for reproducibility
x <- rnorm(10)     # standard normal
x[1] <- x[1] * 10  # introduce outlier

## Winsorize data
x
Winsorize(x)

# use Large and Small, if a fix number of values should be winsorized (here k=3):
Winsorize(x, minval=tail(Small(x, k=3), 1), maxval=head(Large(x, k=3), 1))



