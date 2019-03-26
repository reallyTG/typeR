library(purrr)


### Name: compose
### Title: Compose multiple functions
### Aliases: compose

### ** Examples

not_null <- compose(`!`, is.null)
not_null(4)
not_null(NULL)

add1 <- function(x) x + 1
compose(add1, add1)(8)

# You can use the formula shortcut for functions:
fn <- compose(~ paste(.x, "foo"), ~ paste(.x, "bar"))
fn("input")

# Lists of functions can be spliced with !!!
fns <- list(
  function(x) paste(x, "foo"),
  ~ paste(.x, "bar")
)
fn <- compose(!!!fns)
fn("input")



