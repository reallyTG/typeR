library(SenSrivastava)


### Name: E9.8
### Title: Data on monthly rent, annual income and househould size
### Aliases: E9.8
### Keywords: datasets

### ** Examples

data(E9.8)
attach(E9.8)
E9.8.m1 <- lm(R ~ I + S, data=E9.8)
summary(E9.8.m1)
plot(I, resid(E9.8.m1, type="partial")[,"I"])
plot(S, resid(E9.8.m1, type="partial")[,"S"])
detach()



