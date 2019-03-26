library(rlang)


### Name: cnd_signal
### Title: Signal a condition
### Aliases: cnd_signal

### ** Examples

# Creating a condition of type "foo"
cnd <- cnd("foo")

# If no handler capable of dealing with "foo" is established on the
# stack, signalling the condition has no effect:
cnd_signal(cnd)

# To learn more about establishing condition handlers, see
# documentation for with_handlers(), exiting() and calling():
with_handlers(cnd_signal(cnd),
  foo = calling(function(c) cat("side effect!\n"))
)


# By default, cnd_signal() creates a muffling restart which allows
# calling handlers to prevent a condition from being passed on to
# other handlers and to resume execution:
undesirable_handler <- calling(function(c) cat("please don't call me\n"))
muffling_handler <- calling(function(c) {
  cat("muffling foo...\n")
  cnd_muffle(c)
})

with_handlers(foo = undesirable_handler,
  with_handlers(foo = muffling_handler, {
    cnd_signal(cnd("foo"))
    "return value"
  }))



