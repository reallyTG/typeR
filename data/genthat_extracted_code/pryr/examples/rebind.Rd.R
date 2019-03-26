library(pryr)


### Name: rebind
### Title: Rebind an existing name.
### Aliases: rebind

### ** Examples

a <- 1
rebind("a", 2)
a
# Throws error if no existing binding
## Not run: rebind("b", 2)

local({
  rebind("a", 3)
})
a

# Can't find get because doesn't look past globalenv
## Not run: rebind("get", 1)



