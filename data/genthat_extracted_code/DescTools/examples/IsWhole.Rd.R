library(DescTools)


### Name: Some numeric checks
### Title: Check a Vector For Being Numeric, Zero Or a Whole Number
### Aliases: IsWhole IsNumeric IsZero
### Keywords: logic

### ** Examples

(x <- seq(1,5, by=0.5))
IsWhole( x ) #-->  \code{TRUE} \code{FALSE} \code{TRUE} ...


# ... These are people who live in ignorance of the Floating Point Gods.
# These pagans expect ... (Burns, 2011)" the following to be TRUE:
(.1 - .3 / 3) == 0

# they might be helped by
IsZero(.1 - .3 / 3)





