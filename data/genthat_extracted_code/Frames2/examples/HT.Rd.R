library(Frames2)


### Name: HT
### Title: Horvitz - Thompson estimator
### Aliases: HT

### ** Examples

##########   Example 1   ##########
U <- c(13, 18, 20, 14, 9)
#A simple random sample of size 2 without replacement is drawn from population
s <- sample(U, 2)
ps <- c(0.4, 0.4)
HT(s, ps)

##########   Example 2   ##########
data(DatA)
attach(DatA)
#Let estimate population total for variable Feeding in frame A
HT(Feed, ProbA)



