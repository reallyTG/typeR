library(OBsMD)


### Name: combinations
### Title: Enumerate the Combinations of the Elements of a Vector
### Aliases: combinations
### Keywords: manip

### ** Examples

combinations(3,2,letters[1:3])
combinations(3,2,c(1:3),repeats=TRUE)
combinations(64,4,1:64,repeats=TRUE)



# To use large 'n', you need to change the default recusion limit
options(expressions=1e5)
cmat <- combinations(300,2)
dim(cmat) # 44850 by 2 



