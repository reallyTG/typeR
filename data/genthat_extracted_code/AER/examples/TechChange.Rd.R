library(AER)


### Name: TechChange
### Title: Technological Change Data
### Aliases: TechChange
### Keywords: datasets

### ** Examples

data("TechChange")

## Greene (2003)
## Exercise 7.1
fm1 <- lm(I(output/technology) ~ log(clr), data = TechChange)
fm2 <- lm(I(output/technology) ~ I(1/clr), data = TechChange)
fm3 <- lm(log(output/technology) ~ log(clr), data = TechChange)
fm4 <- lm(log(output/technology) ~ I(1/clr), data = TechChange)

## Exercise 7.2 (a) and (c)
plot(I(output/technology) ~ clr, data = TechChange)

library("strucchange")
sctest(I(output/technology) ~ log(clr), data = TechChange, type = "Chow", point = c(1942, 1))



