library(MKmisc)


### Name: IQrange
### Title: The Interquartile Range
### Aliases: IQrange sIQR
### Keywords: univar robust distribution

### ** Examples

IQrange(rivers)

## identical to
IQR(rivers)

## other quantile algorithms
IQrange(rivers, type = 4)
IQrange(rivers, type = 5)

## standardized IQR
sIQR(rivers)

## right-skewed data distribution
sd(rivers)
mad(rivers)

## for normal data
x <- rnorm(100)
sd(x)
sIQR(x)
mad(x)



