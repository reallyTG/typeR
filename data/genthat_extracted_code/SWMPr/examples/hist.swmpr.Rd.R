library(SWMPr)


### Name: hist.swmpr
### Title: Plot swmpr using a histogram
### Aliases: hist.swmpr

### ** Examples

## get data
data(apadbwq)
dat <- subset(apadbwq, select = 'do_mgl')

## histogram using swmpr method
hist(dat)

## change axis labels, plot title
hist(dat, xlab = 'Dissolved oxygen', main = 'Histogram of DO')

## plot using default method
hist(dat$do_mgl)



