library(ScottKnott)


### Name: sorghum
### Title: Completely Randomized Design (CRD)
### Aliases: sorghum
### Keywords: datasets

### ** Examples

library(ScottKnott)

data(sorghum) 

av <- aov(y ~ r/bl + x,
          data=sorghum$dfm)

sk <- SK(av,
         which='x',
         sig.level=0.05) 

summary(sk)

plot(sk)



