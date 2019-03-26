library(purrr)


### Name: transpose
### Title: Transpose a list.
### Aliases: transpose

### ** Examples

x <- rerun(5, x = runif(1), y = runif(5))
x %>% str()
x %>% transpose() %>% str()
# Back to where we started
x %>% transpose() %>% transpose() %>% str()

# transpose() is useful in conjunction with safely() & quietly()
x <- list("a", 1, 2)
y <- x %>% map(safely(log))
y %>% str()
y %>% transpose() %>% str()

# Use simplify_all() to reduce to atomic vectors where possible
x <- list(list(a = 1, b = 2), list(a = 3, b = 4), list(a = 5, b = 6))
x %>% transpose()
x %>% transpose() %>% simplify_all()

# Provide explicit component names to prevent loss of those that don't
# appear in first component
ll <- list(
  list(x = 1, y = "one"),
  list(z = "deux", x = 2)
)
ll %>% transpose()
nms <- ll %>% map(names) %>% reduce(union)
ll %>% transpose(.names = nms)



