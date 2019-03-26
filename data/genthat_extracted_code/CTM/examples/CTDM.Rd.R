library(CTM)


### Name: CTDM
### Title: Term Document Matrix
### Aliases: CTDM

### ** Examples

library(CTM)
a1 <- "hello taiwan"
b1 <- "world of tank"
c1 <- "taiwan weather"
d1 <- "local weather"
text1 <- t(data.frame(a1,b1,c1,d1))
tdm1 <- CTDM(doc = text1, weighting = "tfidf", EngTermDeleted = FALSE, shortTermDeleted = FALSE)



