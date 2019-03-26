library(pracma)


### Name: Rank
### Title: Matrix Rank
### Aliases: Rank
### Keywords: array

### ** Examples

Rank(magic(10))   #=> 7
Rank(magic(100))  #=> 3 (!)
Rank(hilb(8))     #=> 8 , but qr(hilb(8))$rank says, rank is 7.
# Warning message:
# In Rank(hilb(8)) : Rank calculation may be problematic.



