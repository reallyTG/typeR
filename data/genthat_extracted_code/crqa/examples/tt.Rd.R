library(crqa)


### Name: tt
### Title: Trapping-Time
### Aliases: tt

### ** Examples


## build a random x matrix
r = 100; c = 100
x = round(matrix(runif(r*c), r, c))
whiteline = TRUE
minvertline = 2

ans = tt(x, minvertline, whiteline)




