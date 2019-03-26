library(svMisc)


### Name: describe_function
### Title: Get textual help on function or function arguments, or get a
###   call tip
### Aliases: describe_function describe_args args_tip call_tip descFun
###   descArgs argsTip callTip
### Keywords: utilities

### ** Examples

describe_function("ls", "base")
describe_function("library", "base")
describe_function("descFun", "svMisc")
describe_function("descArgs")

describe_args("ls")
describe_args("library", args = c("package", "pos"))

args_tip("ls")

call_tip("myvar <- lm(")



