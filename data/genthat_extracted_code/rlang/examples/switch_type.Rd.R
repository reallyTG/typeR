library(rlang)


### Name: switch_type
### Title: Dispatch on base types
### Aliases: switch_type coerce_type switch_class coerce_class
### Keywords: internal

### ** Examples

switch_type(3L,
  double = "foo",
  integer = "bar",
  "default"
)

# Use the coerce_ version to get standardised error handling when no
# type matches:
to_chr <- function(x) {
  coerce_type(x, "a chr",
    integer = as.character(x),
    double = as.character(x)
  )
}
to_chr(3L)

# Strings have their own type:
switch_type("str",
  character = "foo",
  string = "bar",
  "default"
)

# Use a fallthrough clause if you need to dispatch on all character
# vectors, including strings:
switch_type("str",
  string = ,
  character = "foo",
  "default"
)

# special and builtin functions are treated as primitive, since
# there is usually no reason to treat them differently:
switch_type(base::list,
  primitive = "foo",
  "default"
)
switch_type(base::`$`,
  primitive = "foo",
  "default"
)

# closures are not primitives:
switch_type(rlang::switch_type,
  primitive = "foo",
  "default"
)



