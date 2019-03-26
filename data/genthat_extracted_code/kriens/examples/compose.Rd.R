library(kriens)


### Name: compose
### Title: Continuation Passing Style Function Composition
### Aliases: compose %.%

### ** Examples

# Example 1

# define an arrow in the Continuation category.
# this function applies the continuation to the
# increment of its argument and then decrements it.
one <- function(x, ret) {
    return(ret(x+1) - 1)
}

# define another arrow in the Continuation category.
# this function doubles its argument.
two <- function(x, ret) {
    return(ret(2*x))
}

# create the composition
# this is exactly the same as one %.% two
composite <- compose(one, two)

# build the function (forget the continuation)
execute1 <- forget(composite)
execute1(1)
# returns 3

# Example 2
# compose the function further to loop over an array of elements
# lapply and sapply are already arrow in the Continuation category
loop <- compose(lapply, composite)

# build the function
execute2 <- forget(loop)
execute2(1:10)



