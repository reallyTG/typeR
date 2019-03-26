library(diffobj)


### Name: diffObj
### Title: Diff Objects
### Aliases: diffObj

### ** Examples

## `pager="off"` for CRAN compliance; you may omit in normal use
diffObj(letters, c(letters[1:10], LETTERS[11:26]), pager="off")
with(mtcars, diffObj(lm(mpg ~ hp)$qr, lm(mpg ~ disp)$qr, pager="off"))



