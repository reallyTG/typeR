library(diffobj)


### Name: diffStr
### Title: Diff Object Structures
### Aliases: diffStr diffStr,ANY-method

### ** Examples

## `pager="off"` for CRAN compliance; you may omit in normal use
with(mtcars, diffStr(lm(mpg ~ hp)$qr, lm(mpg ~ disp)$qr, pager="off"))



