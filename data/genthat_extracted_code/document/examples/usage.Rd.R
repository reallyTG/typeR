library(document)


### Name: usage
### Title: Return the Usage of a Function From Within the Function
### Aliases: usage

### ** Examples

# usage with assignment operator:
foo <- function(x) {
    u <- usage()
    message("Usage is: ", u)
}
foo()

# usage without assignment operator:
bar <- function(x) {
    message(usage(n = -2))
}
bar()



