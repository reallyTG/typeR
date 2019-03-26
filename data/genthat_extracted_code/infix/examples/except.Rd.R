library(infix)


### Name: except
### Title: Simple Error Handling
### Aliases: except tryExcept %except%

### ** Examples

# No errors are raised
tryExcept(stop())

# If 'expr' has no errors
tryExcept({
  foo <- "foo"
}, except = {
  foo <- "foo bar"
})
print(foo) # "foo"

# If 'expr' has an error
tryExcept({
  foo <- "foo"
  stop()
}, except = {
  foo <- "foo bar"
})
print(foo) # "foo bar"

# Running it with the infix operator
{foo <- "foo"} %except% {foo <- "foo bar"}
print(foo) # "foo"

{ foo <- "foo"
  stop()
} %except% {
  foo <- "foo bar"
}
print(foo) # "foo bar"



