library(rlang)


### Name: expr_label
### Title: Turn an expression to a label
### Aliases: expr_label expr_name expr_text

### ** Examples

# To labellise a function argument, first capture it with
# substitute():
fn <- function(x) expr_label(substitute(x))
fn(x:y)

# Strings are encoded
expr_label("a\nb")

# Names and expressions are quoted with ``
expr_label(quote(x))
expr_label(quote(a + b + c))

# Long expressions are collapsed
expr_label(quote(foo({
  1 + 2
  print(x)
})))



