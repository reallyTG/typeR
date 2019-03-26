library(futile.paradigm)


### Name: AbuseMethod
### Title: Dispatcher for high-level API functions
### Aliases: AbuseMethod
### Keywords: methods programming

### ** Examples

# Trivial example for pedagogical reasons only
product <- function(...) AbuseMethod('product', ...)

product.numeric <- function(a,b) a * b
product.matrix <- function(a,b) a 

product(4,2)




