library(rlang)


### Name: exiting
### Title: Create an exiting or in place handler
### Aliases: exiting calling

### ** Examples

# You can supply a function taking a condition as argument:
hnd <- exiting(function(c) cat("handled foo\n"))
with_handlers(signal("A foobar condition occurred", "foo"), foo = hnd)

# Or a lambda-formula where "." is bound to the condition:
with_handlers(foo = calling(~cat("hello", .$attr, "\n")), {
  signal("A foobar condition occurred", "foo", attr = "there")
  "foo"
})



