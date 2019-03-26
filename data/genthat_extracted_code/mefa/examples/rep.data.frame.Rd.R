library(mefa)


### Name: rep.data.frame
### Title: Inflate (repeat) a Data Frame
### Aliases: rep.data.frame
### Keywords: manip

### ** Examples

x <- data.frame(sample = LETTERS[c(1,1,2,2,3)],
    species = letters[c(5,5,5,6,7)],
    count = c(1,2,10,3,4), segment = letters[c(8,9,8,9,8)])
x
rep(x[,c(1,2,4)], times = x[,3])
rep(x[,c(1,2,4)], each = 2)



