library(processR)


### Name: seekNameVars
### Title: select names of variables from list var
### Aliases: seekNameVars

### ** Examples

vars=list(name=list(c("W","Z"),c("V","Q")),site=list(c("a","c"),c("b","c")))
vars=list(name=list(c("W","Z")),site=list(c("a","c")))
seekNameVars(vars,"a")
seekNameVars(vars,"b")
seekNameVars(vars,"c")



