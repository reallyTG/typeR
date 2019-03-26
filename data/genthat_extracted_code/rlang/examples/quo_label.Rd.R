library(rlang)


### Name: quo_label
### Title: Format quosures for printing or labelling
### Aliases: quo_label quo_text quo_name

### ** Examples

# Quosures can contain nested quosures:
quo <- quo(foo(!! quo(bar)))
quo

# quo_squash() unwraps all quosures and returns a raw expression:
quo_squash(quo)

# This is used by quo_text() and quo_label():
quo_text(quo)

# Compare to the unwrapped expression:
expr_text(quo)

# quo_name() is helpful when you need really short labels:
quo_name(quo(sym))
quo_name(quo(!! sym))



