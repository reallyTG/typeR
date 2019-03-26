library(rowr)


### Name: rollApply
### Title: Applies a function over a rolling window on any data object.
### Aliases: rollApply

### ** Examples

rollApply(1:100,sum,minimum=2,window=2)
rollApply(c(1,2,3),sum)
##6 5 3
rollApply(c(1,2,3,4,5,6,7,8,9),sum)
##45 44 42 39 35 30 24 17  9
rollApply(c(1,2,3,4,5,6,7,8,9),sum,window=2)
##3  5  7  9 11 13 15 17  9
rollApply(list(1,2,3,4,5,6,7,8,9),function(x) sum(unlist(x)),window=2,minimum=2)
##3  5  7  9 11 13 15 17
cbind(women,Rolling3=rollApply(women,fun=function(x) mean(x$weight),window=3,align='right'))




