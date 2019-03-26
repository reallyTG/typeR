library(Hmisc)


### Name: rcspline.restate
### Title: Re-state Restricted Cubic Spline Function
### Aliases: rcspline.restate rcsplineFunction
### Keywords: regression interface character

### ** Examples

set.seed(1)
x <- 1:100
y <- (x - 50)^2 + rnorm(100, 0, 50)
plot(x, y)
xx <- rcspline.eval(x, inclx=TRUE, nk=4)
knots <- attr(xx, "knots")
coef <- lsfit(xx, y)$coef
options(digits=4)
# rcspline.restate must ignore intercept
w <- rcspline.restate(knots, coef[-1], x="{\\rm BP}")
# could also have used coef instead of coef[-1], to include intercept
cat(attr(w,"latex"), sep="\n")


xtrans <- eval(attr(w, "function"))
# This is an S function of a single argument
lines(x, coef[1] + xtrans(x), type="l")
# Plots fitted transformation

xtrans <- rcsplineFunction(knots, coef)
xtrans
lines(x, xtrans(x), col='blue')


#x <- blood.pressure
xx.simple <- cbind(x, pmax(x-knots[1],0)^3, pmax(x-knots[2],0)^3,
                       pmax(x-knots[3],0)^3, pmax(x-knots[4],0)^3)
pred.value <- coef[1] + xx.simple %*% w
plot(x, pred.value, type='l')   # same as above



