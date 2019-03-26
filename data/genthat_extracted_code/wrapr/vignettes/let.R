## ------------------------------------------------------------------------
x = 5
print(5 + 1)
print(x + 1)

## ------------------------------------------------------------------------
set.seed(1234)
xvar = runif(100) - 0.5
yvar = dnorm(xvar)

plot(xvar, yvar) 

## ------------------------------------------------------------------------
d <- data.frame(x=c(1,NA))
d$x

## ------------------------------------------------------------------------
library("wrapr")

xvariable = "xvar"
yvariable = "yvar"
let(
  c(XVARIABLE=xvariable, YVARIABLE=yvariable),
  { # since we have the names as strings, we can create a title
    title = paste(yvariable, "vs", xvariable)
    plot(XVARIABLE, YVARIABLE, main=title)
  }
)

## ------------------------------------------------------------------------
a <- 1
b <- 2
let(c(z=quote(a)), z+b)
eval(substitute(z+b, c(z=quote(a))))

