library(soundgen)


### Name: clumper
### Title: Clump a sequence into large segments
### Aliases: clumper
### Keywords: internal

### ** Examples

s = c(1,3,2,2,2,0,0,4,4,1,1,1,1,1,3,3)
soundgen:::clumper(s, 2)
soundgen:::clumper(s, 3)
soundgen:::clumper(s, seq(1, 3, length.out = length(s)))
soundgen:::clumper(c('a','a','a','b','b','c','c','c','a','c'), 4)



