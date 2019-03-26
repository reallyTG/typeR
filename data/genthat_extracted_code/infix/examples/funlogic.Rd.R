library(infix)


### Name: funlogic
### Title: Function Logical Operators
### Aliases: funlogic %&% %|% %xor%

### ** Examples

is.null.na <- is.null %|% is.na
all(is.null.na(NA), is.null.na(NULL)) # returns TRUE



