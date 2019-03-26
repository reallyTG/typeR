library(SenSrivastava)


### Name: E9.3
### Title: "Areas", lengths and widths of rectangles
### Aliases: E9.3
### Keywords: datasets

### ** Examples

data(E9.3)
E9.3.m1 <- lm(y ~ x1 + x2, data=E9.3)
attach(E9.3)
plot(x1, resid(E9.3.m1))
plot(x2, resid(E9.3.m1))
detach(E9.3)



