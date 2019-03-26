library(CTM)


### Name: termCount
### Title: Term Count
### Aliases: termCount

### ** Examples

library(CTM)
a1 <- "hello taiwan"
b1 <- "world of tank"
c1 <- "taiwan weather"
d1 <- "local weather"
text1 <- t(data.frame(a1,b1,c1,d1))
count1 <- termCount(doc = text1, EngTermDeleted=FALSE, shortTermDeleted = FALSE)



