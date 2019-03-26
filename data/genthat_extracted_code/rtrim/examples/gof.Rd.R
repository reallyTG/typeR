library(rtrim)


### Name: gof
### Title: Extract TRIM goodness-of-fit information.
### Aliases: gof gof.trim

### ** Examples

data(skylark)
z <- trim(count ~ site + time, data=skylark, model=2)
# prettyprint GOF information
gof(z)

# get individual elements, e.g. p-value
L <- gof(z)
LR_p <- L$LR$p # get p-value for likelihood ratio




