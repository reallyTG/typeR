library(OneR)


### Name: bin
### Title: Binning function
### Aliases: bin
### Keywords: Jenks binning breaks clusters discretization discretize

### ** Examples

data <- iris
str(data)
str(bin(data))
str(bin(data, nbins = 3))
str(bin(data, nbins = 3, labels = c("small", "medium", "large")))

## Difference between methods "length" and "content"
set.seed(1); table(bin(rnorm(900), nbins = 3))
set.seed(1); table(bin(rnorm(900), nbins = 3, method = "content"))

## Method "clusters"
intervals <- paste(levels(bin(faithful$waiting, nbins = 2, method = "cluster")), collapse = " ")
hist(faithful$waiting, main = paste("Intervals:", intervals))
abline(v = c(42.9, 67.5, 96.1), col = "blue")

## Missing values
bin(c(1:10, NA), nbins = 2, na.omit = FALSE) # adds new level "NA"
bin(c(1:10, NA), nbins = 2)                  # omits missing values by default (with warning)



