library(vcfR)


### Name: masplit
### Title: masplit
### Aliases: masplit

### ** Examples

set.seed(999)
x1 <- round(rnorm(n=9, mean=10, sd=2))
x2 <- round(rnorm(n=9, mean=20, sd=2))
ad <- matrix(paste(x1, x2, sep=","), nrow=3, ncol=3)
colnames(ad) <- paste('Sample', 1:3, sep="_")
rownames(ad) <- paste('Variant', 1:3, sep="_")
ad[1,1] <- "9,23,12"
is.na(ad[3,1]) <- TRUE

ad
masplit(ad, count = 1)
masplit(ad, sort = 0)
masplit(ad, sort = 0, record = 2)
masplit(ad, sort = 0, record = 3)
masplit(ad, sort = 1, decreasing = 0)





