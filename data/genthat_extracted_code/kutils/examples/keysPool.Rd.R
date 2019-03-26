library(kutils)


### Name: keysPool
### Title: Homogenize class values and create a long key by pooling
###   variable keys.
### Aliases: keysPool

### ** Examples

dat1 <- data.frame(x1 = as.integer(rnorm(100)), x2 = sample(c("Apple", "Orange"),
                   100, replace = TRUE), x3 = ifelse(rnorm(100) < 0, TRUE, FALSE))
dat2 <- data.frame(x1 = rnorm(100), x2 = ordered(sample(c("Apple", "Orange"),
                   100, replace = TRUE)), x3 = rbinom(100, 1, .5),
                   stringsAsFactors = FALSE)
key1 <- keyTemplate(dat1, long = TRUE)
key2 <- keyTemplate(dat2, long = TRUE)
keys2stack <- rbind(key1, key2)
keys2stack.fix <- keysPool(keys2stack)
keys2stack.fix2 <- keysPool(keys2stack.fix, colname = "class_new")
## Sometimes this will not be able to homogenize
dat1 <- data.frame(x1 = as.integer(rnorm(100)),
                   x2 = sample(c("Apple", "Orange"), 100, replace = TRUE))
dat2 <- data.frame(x1 = rnorm(100),
                   x2 = sample(c("Apple", "Orange"), 100, replace = TRUE),
                   stringsAsFactors = FALSE)
key1 <- keyTemplate(dat1, long = TRUE)
key2 <- keyTemplate(dat2, long = TRUE)
## Create a stack of keys for yourself
keys2stack <- rbind(key1, key2)
keys.fix <- keysPool(keys2stack)
## We will create stack of keys for you
keys.fix2 <- keysPool(list(key1, key2)) 
## View(keys.fix)
## View(keys.fix2)


## If you have wide keys, convert them with wide2long, either by
key1 <- keyTemplate(dat1)
key2 <- keyTemplate(dat2)
keysstack.wide <- rbind(wide2long(key1), wide2long(key2))
keys.fix <- keysPool(keysstack.wide)
## or
keysPool(list(wide2long(key1), wide2long(key2)))



