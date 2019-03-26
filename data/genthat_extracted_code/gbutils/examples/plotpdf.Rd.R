library(gbutils)


### Name: plotpdf
### Title: Plot a probability denstity function
### Aliases: plotpdf
### Keywords: hplot dplot

### ** Examples

pdf1 <- function(x) dnorm(x, mean = 100, sd = 5)
qdf1 <- function(x) qnorm(x, mean = 100, sd = 5)
cdf1 <- function(x) pnorm(x, mean = 100, sd = 5)

plot(pdf1) # needs to specify 'from' and 'to' args for meaningful plot
plotpdf(pdf1, qdf1)                               # using quantile function
plotpdf(pdf1, cdf = cdf1)                         # using cdf
plotpdf(pdf1, cdf = cdf1, lq = 0.001, uq = 0.999) # ... and non-default quantiles

plotpdf(cdf1, cdf = cdf1, lq = 0.001, uq = 0.999) # plot a cdf


## a mixture distribution:
pf1 <- function(x){
    0.25 * pnorm(x, mean = 3, sd = 0.2) + 0.75 * pnorm(x, mean = -1, sd = 0.5)
}
df1 <- function(x){
    0.25 * dnorm(x, mean = 3, sd = 0.2) + 0.75 * dnorm(x, mean = -1, sd = 0.5)
}

plotpdf(df1, cdf = pf1) # plot the pdf
plotpdf(pf1, cdf = pf1) # plot the cdf

c(cdf2quantile(0.05, pf1), cdf2quantile(0.95, pf1))



