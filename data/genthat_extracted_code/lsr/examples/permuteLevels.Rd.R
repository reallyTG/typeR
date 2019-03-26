library(lsr)


### Name: permuteLevels
### Title: Permute the levels of a factor
### Aliases: permuteLevels

### ** Examples

#### Example 

# original factor specifies the levels in order: a,b,c,d,e,f
x <- factor( c(1,4,2,2,3,3,5,5,6,6), labels=letters[1:6] )
print(x)

# apply permutation (5 3 2 1 4 6)... i.e., move 5th factor level (e)
# into position 1, move 3rd factor level (c) into position 2, etc
permuteLevels(x,perm = c(5,3,2,1,4,6))

# apply the inverse of permutation (5 3 2 1 4 6)... i.e., move 1st
# level (a) into position 5, move 2nd level (b) into position 3, etc
permuteLevels(x,perm = c(5,3,2,1,4,6),invert=TRUE)




