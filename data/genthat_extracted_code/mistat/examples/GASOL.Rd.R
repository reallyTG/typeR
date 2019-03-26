library(mistat)


### Name: GASOL
### Title: Distillation Properties of Crude Oils
### Aliases: GASOL
### Keywords: datasets

### ** Examples

data(GASOL)

LmYield <- lm(yield ~ 1 + astm + endPt, 
              data=GASOL)

summary(LmYield)



