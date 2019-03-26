library(flexclust)


### Name: bundestag
### Title: German Parliament Election Data
### Aliases: bundestag btw2002 btw2005 btw2009
### Keywords: datasets

### ** Examples

p02 <- bundestag(2002)
pairs(p02)
p05 <- bundestag(2005)
pairs(p05)
p09 <- bundestag(2009)
pairs(p09)

state <- bundestag(2002, state=TRUE)
table(state)

start.with.b <- bundestag(2002, state="^B")
table(start.with.b)

pairs(p09, col=2-(state=="Bayern"))



