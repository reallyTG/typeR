library(tidytidbits)


### Name: local_variables
### Title: "Variable generating" functions
### Aliases: local_variables localVariables source_variables
###   sourceVariables

### ** Examples

myVariableGeneratingFunction <- function()
{
  x <- 1
  y <- 2
  local_variables()
}
myMainFunction <- function()
{
  source_variables(myVariableGeneratingFunction())
  print(c(x, y))
}



