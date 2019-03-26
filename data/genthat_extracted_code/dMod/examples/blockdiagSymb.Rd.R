library(dMod)


### Name: blockdiagSymb
### Title: Embed two matrices into one blockdiagonal matrix
### Aliases: blockdiagSymb

### ** Examples

M <- matrix(1:9, 3, 3, dimnames = list(letters[1:3], letters[1:3]))
N <- matrix(1:4, 2, 2, dimnames = list(LETTERS[1:2], LETTERS[1:2]))
blockdiagSymb(M, N)



