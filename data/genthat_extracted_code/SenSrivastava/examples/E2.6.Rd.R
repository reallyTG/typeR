library(SenSrivastava)


### Name: E2.6
### Title: Voltage Data
### Aliases: E2.6
### Keywords: datasets

### ** Examples

data(E2.6)
E2.6.m1 <- lm(V.c/V.a ~ V.a + I(V.a^2), data=E2.6)
plot(E2.6.m1)



