library(pryr)


### Name: find_uses
### Title: Find all functions in that call supplied functions.
### Aliases: find_uses

### ** Examples

names(find_uses("package:base", "sum"))

envs <- c("package:base", "package:utils", "package:stats")
funs <- c("match.call", "sys.call")
find_uses(envs, funs)



