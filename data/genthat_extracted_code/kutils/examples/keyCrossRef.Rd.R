library(kutils)


### Name: keyCrossRef
### Title: keyCrossRef
### Aliases: keyCrossRef

### ** Examples

dat <- data.frame(x1 = sample(c("a", "b", "c", "d"), 100, replace = TRUE),
                  x2 = sample(c("Apple", "Orange"), 100, replace = TRUE),
                  x3 = ordered(sample(c("low", "medium", "high"), 100, replace = TRUE),
                  levels = c("low", "medium", "high")),
                  stringsAsFactors = FALSE)
key <- keyTemplate(dat, long = TRUE)
## No errors with a fresh key.
kutils:::keyCrossRef(key, verbose = TRUE)
key[1:2, "value_new"] <- c("b", "a")
key[5, "value_new"]
key[7:9, "value_new"] <- c("high", "medium", "low")
kutils:::keyCrossRef(key)
kutils:::keyCrossRef(key, ignoreClass = c("ordered", "character"), verbose = TRUE)



