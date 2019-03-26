library(pracma)


### Name: nearest_spd
### Title: Nearest Symmetric Positive-definite Matrix
### Aliases: nearest_spd
### Keywords: array

### ** Examples

A <- matrix(1:9, 3, 3)
B <- nearest_spd(A); B
#          [,1]     [,2]     [,3]
# [1,] 2.034900 3.202344 4.369788
# [2,] 3.202344 5.039562 6.876781
# [3,] 4.369788 6.876781 9.383774
norm(B - A, type = 'F')
# [1] 3.758517



