library(UsingR)


### Name: galileo
### Title: Galileo data on falling bodies
### Aliases: galileo
### Keywords: datasets

### ** Examples

data(galileo)
polynomial = function(x,coefs) {
  sum = 0
  for(i in 0:(length(coefs)-1)) {
    sum = sum + coefs[i+1]*x^i
  }
  sum
}
res.lm = lm(h.d ~ init.h, data = galileo)
res.lm2 = update(res.lm, . ~ . + I(init.h^2), data=galileo)
res.lm3 = update(res.lm2, . ~ . + I(init.h^3), data=galileo)
plot(h.d ~ init.h, data = galileo)
curve(polynomial(x,coef(res.lm)),add=TRUE)
curve(polynomial(x,coef(res.lm2)),add=TRUE)
curve(polynomial(x,coef(res.lm3)),add=TRUE)




