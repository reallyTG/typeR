library(pryr)


### Name: find_funs
### Title: Find functions matching criteria.
### Aliases: find_funs fun_calls fun_args fun_body

### ** Examples

find_funs("package:base", fun_calls, "match.fun", fixed = TRUE)
find_funs("package:stats", fun_args, "^[A-Z]+$")

fun_calls(match.call)
fun_calls(write.csv)

fun_body(write.csv)
find_funs("package:utils", fun_body, "write", fixed = TRUE)



