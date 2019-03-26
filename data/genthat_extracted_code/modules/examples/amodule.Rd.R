library(modules)


### Name: amodule
### Title: Define Augmented and Parameterized Modules
### Aliases: amodule

### ** Examples

Constructor <- function(dependency) {
  amodule({
    fun <- function(...) dependency(...)
  })
}
instance <- Constructor(identity)
instance$fun(1)




