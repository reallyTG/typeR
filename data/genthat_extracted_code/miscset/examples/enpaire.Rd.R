library(miscset)


### Name: enpaire
### Title: Create a Pairwise List from a Matrix
### Aliases: enpaire enpaire.default enpaire.dist enpaire.matrix
### Keywords: matrix pairwise

### ** Examples

#

m <- matrix(letters[1:9], 3, 3, dimnames = list(1:3,1:3))
enpaire(m)
enpaire(m, lower = FALSE)

#



