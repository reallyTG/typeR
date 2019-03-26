library(NostalgiR)


### Name: nos.hist
### Title: nos.hist text-based plot of a histogram.
### Aliases: nos.hist

### ** Examples

## Plot a histogram for the frequencies of 100 random standard normal points
## using 'Sturges' breaks and plot symbol 'o'.
data <- rnorm(100)
nos.hist(data)

## Plot a histogram for the densities of 1000 random chi-squared(3) points
## using 'FD' breaks and plot symbol '#'.
data <- rchisq(1000,3)
nos.hist(data,breaks='FD',freq=FALSE,pch='#')



