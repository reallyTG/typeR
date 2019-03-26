library(compare)


### Name: compareEqual
### Title: Compare Two Objects for Equality
### Aliases: compareEqual compareEqual.logical compareEqual.numeric
###   compareEqual.character compareEqual.factor compareEqual.matrix
###   compareEqual.array compareEqual.table compareEqual.data.frame
###   compareEqual.list
### Keywords: utilities logic

### ** Examples

compareEqual(letters, paste(" ", letters, " "), trim=TRUE)
compareEqual(c(.1, 1, 10), c(.13, 1.3, 13),
             round=function(x) { signif(x, 1) })



