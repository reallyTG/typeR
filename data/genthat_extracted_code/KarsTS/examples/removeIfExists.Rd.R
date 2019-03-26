library(KarsTS)


### Name: removeIfExists
### Title: removeIfExists: remove if exists
### Aliases: removeIfExists
### Keywords: ~kwd1 ~kwd2

### ** Examples


# Create a vector in the KTSEnv environment
KTSEnv$ThisExists <- 1:30

# It does not throw an error when the element to remove does not exist
removeIfExists(c("ThisExists", "ThisDoesNot"), envir = KTSEnv)





