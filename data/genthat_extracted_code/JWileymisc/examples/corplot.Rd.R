library(JWileymisc)


### Name: corplot
### Title: Heatmap of a Correlation Matrix
### Aliases: corplot
### Keywords: hplot

### ** Examples

# example plotting the correlation matrix from the
# mtcars dataset
corplot(cor(mtcars))

dat <- as.matrix(iris[, 1:4])

# randomly set 25% of the data to missing
set.seed(10)
dat[sample(length(dat), length(dat) * .25)] <- NA

# create a summary of the data (including coverage matrix)
sdat <- SEMSummary(~ ., data = dat)
# using the plot method for SEMSummary (which basically just calls corplot)
plot(sdat)

## getting p values instaed of coverage
# plot(sdat, plot = "p")

## showing correlations instead of coverage
# plot(sdat, plot = "cor")

# use the control.grobs argument to adjust the coverage scaling
# to go from 0 to 1 rather than the range of coverage
corplot(x = sdat$sSigma, coverage = sdat$coverage,
  control.grobs = list(area = quote(scale_size_area(limits = c(0, 1))))
)

# also works with plot() on a SEMSummary
plot(x = sdat, control.grobs = list(area = quote(scale_size_area(limits = c(0, 1)))))

rm(dat, sdat)



