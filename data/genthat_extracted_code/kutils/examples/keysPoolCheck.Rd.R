library(kutils)


### Name: keysPoolCheck
### Title: Compares keys from different data sets; finds differences
###   classes of variables. This used to check for similarity of keys from
###   various data sets, one precursor to either combining the keys or
###   merging the data sets themselves.
### Aliases: keysPoolCheck

### ** Examples

set.seed(234)
dat1 <- data.frame(x1 = rnorm(100),
                   x2 = sample(c("Male", "Female"), 100, replace = TRUE),
                   x3_TEXT = "A", x4 = sample(1:10000, 100))
dat2 <- data.frame(x1 = rnorm(100), x2 = sample(c("Male", "Female"),
                   100, replace = TRUE),
                   x3_TEXT = sample(1:100, 100),
                   stringsAsFactors = FALSE)
key1 <- keyTemplate(dat1)
key2 <- keyTemplate(dat2)
keys <- list(key1, key2)
keysPoolCheck(keys)
## See problem in class_old
keysPoolCheck(keys, col = "class_old")
## problems in class_new
keysPoolCheck(keys, col = "class_new")
keysPoolCheck(keys, excludere = "TEXT$")



