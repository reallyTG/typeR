library(hash)


### Name: is.empty
### Title: Test if a hash has no key-value pairs.
### Aliases: is.empty
### Keywords: methods

### ** Examples

    h <- hash( a=1, b=2, c=3 )
    is.empty(h)    # FALSE
    clear(h)
    is.empty(h)    # TRUE
    h <- hash()
    is.empty(h)    # TRUE



