library(cleanr)


### Name: is_not_false
### Title: Test if an Object is not False
### Aliases: is_not_false

### ** Examples

a  <- 1
is_not_false(a)
f <- function() {
    a <- NULL
    should_be_true <- ! is_not_false(a, null_is_false = TRUE, 
                                      where = environment())
    return(should_be_true)
}
print(f())



