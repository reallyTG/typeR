library(NostalgiR)


### Name: nos.qqplot
### Title: nos.qqplot text-based generic quantile-quantile plots
### Aliases: nos.qqplot

### ** Examples

## Produce a quantile-quantile plot between two samples of 10 random standard normal points,
## without the line of theoretical quantile equality.
x <- rnorm(10)
y <- rnorm(10)
nos.qqplot(x,y,line=FALSE)

## Produce a quantile-quantile plot of 100 random chi-squared(3) points against the
## true theoretical distribution, with the line of theoretical quantile equality.
y <- rchisq(100,3)
x <- qchisq(ppoints(100),3)
nos.qqplot(x,y,xlab='Theoretical Qs',ylab='Sample Qs')



