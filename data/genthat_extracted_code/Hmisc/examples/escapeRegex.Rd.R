library(Hmisc)


### Name: escapeRegex
### Title: Escapes any characters that would have special meaning in a
###   reqular expression.
### Aliases: escapeRegex escapeBS
### Keywords: manip character programming

### ** Examples

string <- "this\\(system) {is} [full]."
escapeRegex(string)

escapeBS(string)

## Don't show: 
if(!any(grep(escapeRegex(string), string))) {
  stop("function escapeRegex failed test")
}

if(escapeBS(string) != "this\\\\(system) {is} [full].") {
  stop("function escapeBS failed test")
}
## End(Don't show)



