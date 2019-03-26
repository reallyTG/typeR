library(anomalize)


### Name: anomalize_methods
### Title: Methods that power anomalize()
### Aliases: anomalize_methods iqr gesd

### ** Examples


set.seed(100)
x <- rnorm(100)
idx_outliers <- sample(100, size = 5)
x[idx_outliers] <- x[idx_outliers] + 10

iqr(x, alpha = 0.05, max_anoms = 0.2)
iqr(x, alpha = 0.05, max_anoms = 0.2, verbose = TRUE)

gesd(x, alpha = 0.05, max_anoms = 0.2)
gesd(x, alpha = 0.05, max_anoms = 0.2, verbose = TRUE)





