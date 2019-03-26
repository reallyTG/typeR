library(OpasnetUtils)


### Name: dropall
### Title: Dropall
### Aliases: dropall

### ** Examples

a <- data.frame(A = c("a", "b"), B = c(1,1))
levels(a[[1]])

a <- a[-2 ,]
levels(a[[1]])
a[[1]]

a <- dropall(a)
levels(a[[1]])
a[[1]]



