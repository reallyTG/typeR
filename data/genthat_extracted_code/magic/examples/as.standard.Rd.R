library(magic)


### Name: as.standard
### Title: Standard form for magic squares
### Aliases: as.standard is.standard is.standard.toroidal
### Keywords: array

### ** Examples

is.standard(magic.2np1(4))
as.standard(magic.4n(3))

as.standard(magichypercube.4n(1,5))

##non-square arrays:
as.standard(magic(7)[1:3,])


## Toroidal transforms preserve pandiagonalness:
is.pandiagonal(as.standard(hudson(11)))


## but not magicness:
is.magic(as.standard(magic(10),TRUE))





