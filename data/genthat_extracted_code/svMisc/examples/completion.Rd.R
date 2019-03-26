library(svMisc)


### Name: completion
### Title: Get a completion list for a R code fragment
### Aliases: completion
### Keywords: utilities

### ** Examples

# A data frame
data(iris)
completion("item <- iris$")
completion("item <- iris[[")

# An S4 object
setClass("track", representation(x = "numeric", y = "numeric"))
t1 <- new("track", x = 1:20, y = (1:20)^2)
completion("item2 <- t1@")

# A namespace
completion("utils::", description = TRUE)

# A partial identifier
completion("item3 <- va", description = TRUE)

# Otherwise, a list with the content of .GlobalEnv
completion("item4 <- ")

# TODO: directory and filename completion!
rm(iris, t1)



