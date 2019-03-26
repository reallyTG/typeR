library(pryr)


### Name: modify_lang
### Title: Recursively modify a language object
### Aliases: modify_lang

### ** Examples

a_to_b <- function(x) {
  if (is.name(x) && identical(x, quote(a))) return(quote(b))
  x
}
examples <- list(
  quote(a <- 5),
  alist(a = 1, c = a),
  function(a = 1) a * 10,
  expression(a <- 1, a, f(a), f(a = a))
)
modify_lang(examples, a_to_b)
# Modifies all objects called a, but doesn't modify arguments named a



