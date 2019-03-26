library(purrr)


### Name: lift
### Title: Lift the domain of a function
### Aliases: lift lift_dl lift_dv lift_vl lift_vd lift_ld lift_lv

### ** Examples

### Lifting from ... to list(...) or c(...)

x <- list(x = c(1:100, NA, 1000), na.rm = TRUE, trim = 0.9)
lift_dl(mean)(x)

# Or in a pipe:
mean %>% lift_dl() %>% invoke(x)

# You can also use the lift() alias for this common operation:
lift(mean)(x)

# Default arguments can also be specified directly in lift_dl()
list(c(1:100, NA, 1000)) %>% lift_dl(mean, na.rm = TRUE)()

# lift_dl() and lift_ld() are inverse of each other.
# Here we transform sum() so that it takes a list
fun <- sum %>% lift_dl()
fun(list(3, NA, 4, na.rm = TRUE))

# Now we transform it back to a variadic function
fun2 <- fun %>% lift_ld()
fun2(3, NA, 4, na.rm = TRUE)

# It can sometimes be useful to make sure the lifted function's
# signature has no named parameters, as would be the case for a
# function taking only dots. The lifted function will take a list
# or vector but will not match its arguments to the names of the
# input. For instance, if you give a data frame as input to your
# lifted function, the names of the columns are probably not
# related to the function signature and should be discarded.
lifted_identical <- lift_dl(identical, .unnamed = TRUE)
mtcars[c(1, 1)] %>% lifted_identical()
mtcars[c(1, 2)] %>% lifted_identical()
#


### Lifting from c(...) to list(...) or ...

# In other situations we need the vector-valued function to take a
# variable number of arguments as with pmap(). This is a job for
# lift_vd():
pmap(mtcars, lift_vd(mean))

# lift_vd() will collect the arguments and concatenate them to a
# vector before passing them to ..f. You can add a check to assert
# the type of vector you expect:
lift_vd(tolower, .type = character(1))("this", "is", "ok")
#


### Lifting from list(...) to c(...) or ...

# cross() normally takes a list of elements and returns their
# cartesian product. By lifting it you can supply the arguments as
# if it was a function taking dots:
cross_dots <- lift_ld(cross)
out1 <- cross(list(a = 1:2, b = c("a", "b", "c")))
out2 <- cross_dots(a = 1:2, b = c("a", "b", "c"))
identical(out1, out2)

# This kind of lifting is sometimes needed for function
# composition. An example would be to use pmap() with a function
# that takes a list. In the following, we use some() on each row of
# a data frame to check they each contain at least one element
# satisfying a condition:
mtcars %>% pmap(lift_ld(some, partial(`<`, 200)))

# Default arguments for ..f can be specified in the call to
# lift_ld()
lift_ld(cross, .filter = `==`)(1:3, 1:3) %>% str()


# Here is another function taking a list and that we can update to
# take a vector:
glue <- function(l) {
  if (!is.list(l)) stop("not a list")
  l %>% invoke(paste, .)
}

## Not run: 
##D letters %>% glue()           # fails because glue() expects a list
## End(Not run)

letters %>% lift_lv(glue)()  # succeeds



