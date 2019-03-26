library(stackoverflow)


### Name: invinteraction
### Title: Split an interaction'ed factor back into seperate variables
### Aliases: invinteraction

### ** Examples


f1 <- gl(2, 3)
f2 <- gl(3, 2)
invinteraction(f1:f2, sep=':') 

ppl <- interaction(
  eyes = as.factor(sample(colors(), 10)),
  hair = as.factor(sample(colors(), 10))
  )
str(invinteraction(ppl, "eyes", "hair"))




