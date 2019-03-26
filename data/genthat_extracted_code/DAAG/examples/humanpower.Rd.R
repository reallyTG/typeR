library(DAAG)


### Name: humanpower
### Title: Oxygen uptake versus mechanical power, for humans
### Aliases: humanpower1 humanpower2
### Keywords: datasets

### ** Examples

str(humanpower1)
plot(humanpower1)
lm(o2 ~ id + wattsPerKg:id, data=humanpower1)
lm(o2 ~ id + wattsPerKg:id, data=humanpower2)



