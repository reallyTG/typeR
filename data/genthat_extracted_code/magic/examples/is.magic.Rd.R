library(magic)


### Name: is.magic
### Title: Various tests for the magicness of a square
### Aliases: is.magic is.panmagic is.pandiagonal is.semimagic
###   is.semimagic.default is.associative is.regular is.ultramagic
###   is.normal is.sparse is.mostperfect is.2x2.correct is.bree.correct
###   is.latin is.antimagic is.totally.antimagic is.heterosquare
###   is.totally.heterosquare is.sam is.stam
### Keywords: array

### ** Examples

is.magic(magic(4))

is.magic(diag(7),func=max)  # TRUE
is.magic(diag(8),func=max)  # FALSE

stopifnot(is.magic(magic(3:8)))

is.panmagic(panmagic.4())
is.panmagic(panmagic.8())

data(Ollerenshaw)
is.mostperfect(Ollerenshaw)

proper.magic <- function(m){is.magic(m) & is.normal(m)}
proper.magic(magic(20))



