library(jsr223)


### Name: CompiledScript
### Title: CompiledScript Class
### Aliases: CompiledScript
### Keywords: programming interface

### ** Examples

library("jsr223")
engine <- ScriptEngine$new("javascript")

# Compile a code snippet.
cs <- engine$compile("c + d")

# This line would throw an error because 'c' and 'd' have not yet been declared.
## cs$eval()

engine$c <- 2
engine$d <- 3
cs$eval()

## 5

# Supply new bindings...
lst <- list(c = 6, d = 7)
cs$eval(bindings = lst)

## 13

# When 'bindings' is not specified, the script engine reverts to the original
# environment.
cs$eval()

## 5

# The following line executes the code but discards the return value.
cs$eval(discard.return.value = TRUE)

# Terminate the engine.
engine$terminate()



