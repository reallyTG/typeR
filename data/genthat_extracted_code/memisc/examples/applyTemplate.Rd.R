library(memisc)


### Name: applyTemplate
### Title: Apply a Formatting Template to a Numeric or Character Vector
### Aliases: applyTemplate template
### Keywords: misc utilities

### ** Examples

applyTemplate(c(a=.0000000000000304,b=3),template=c("($1:g7#)($a:*)"," (($1:f2)) "))
applyTemplate(c(a=.0000000000000304,b=3),template=c("($a:g7#)($a:*)"," (($b:f2)) "))



