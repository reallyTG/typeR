library(oppr)


### Name: %T>%
### Title: Tee operator
### Aliases: %T>% tee

### ** Examples

# the tee operator returns the left-hand side of the result and can be
# useful when dealing with mutable objects. In this example we want
# to use the function "f" to modify the object "e" and capture the
# result

# create an empty environment
e <- new.env()

# create a function to modify an environment and return NULL
f <- function(x) {x$a <- 5; return(NULL)}

# if we use the pipe operator we won't capture the result since "f"()
# returns a NULL
e2 <- e %>% f()
print(e2)

# but if we use the tee operator then the result contains a copy of "e"
e3 <- e %T>% f()
print(e3)




