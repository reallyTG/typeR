library(permutations)


### Name: c
### Title: Concatenation of permutations
### Aliases: c c.word c.cycle rep.permutation

### ** Examples

x <- as.cycle(1:5)
y <- cycle(list(list(1:4,8:9),list(1:2)))


# concatenate cycles:
c(x,y)

# concatenate words:
c(rperm(5,3),rperm(6,9))   # size adjusted to maximum size of args


# repeat words:
rep(x, times=3)






