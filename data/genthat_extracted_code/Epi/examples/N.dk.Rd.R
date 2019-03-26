library(Epi)


### Name: N.dk
### Title: Population size in Denmark
### Aliases: N.dk
### Keywords: datasets

### ** Examples

data(N.dk)
str(N.dk)
with(N.dk,addmargins(tapply(N,list(P,sex),sum),2))
with(subset(N.dk,P==max(P)),addmargins(tapply(N,list(A,sex),sum)))



