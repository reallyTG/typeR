library(rccmisc)


### Name: exceed_threshold
### Title: Check if transformation/coercing of a vector is good enaough
### Aliases: exceed_threshold

### ** Examples


x <- c(rep("2012-01-01", 9), "foo")
exceed_threshold(x, as.Date(x))
exceed_threshold(x, as.Date(x), force = TRUE)
exceed_threshold(x, as.Date(x), ask = TRUE)
exceed_threshold(x, as.Date(x), threshold = 1)
exceed_threshold(x, as.Date(x), var_name = "bar", force = TRUE)

x <- c(1:9, "baz")
exceed_threshold(x, suppressWarnings(as.numeric(x)))



