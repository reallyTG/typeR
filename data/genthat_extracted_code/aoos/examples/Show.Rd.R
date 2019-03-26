library(aoos)


### Name: Show-class
### Title: Show class
### Aliases: Show-class show,Show-method

### ** Examples

ClassWithShowMethod <- defineClass("ClassWithShowMethod", contains = "Show", {
  show <- function() print(summary(.self))
})

ClassWithShowMethod()



