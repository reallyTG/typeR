library(sitar)


### Name: ifun
### Title: Invert an expression defining a data transformation
### Aliases: ifun

### ** Examples

## for best effect run all the code

## define varname variable
(age <- 1:9)

## simple case - age transformed to log(age)
(expr <- quote(log(age)))
## transformed age
eval(expr)
## inverting function, with "varname" attribute set to "age"
ifun(expr)
## inverted transformed age identical to age
all.equal(age, ifun(expr)(eval(expr)))

## more complex case - age transformed to log age since conception
(expr <- quote(log(age + 0.75)))
## inverting function
ifun(expr)
## inverted transformed age identical to age
all.equal(age, ifun(expr)(eval(expr)))

## ludicrously complex case involving exp, log10, ^, pi and trigonometry
(expr <- quote((exp(sin(pi * log10(age + 0.75)/2) - 1)^4)))
## inverting function, showing intermediate stages
ifun(expr, verbose=TRUE)
## identical to original
all.equal(age, ifun(expr)(eval(expr)))

## example of plot.sitar back-transforming transformed x and y in sitar models
## fit sitar models
m1 <- sitar(x=age, y=height^2, id=id, data=heights, df=6)
m2 <- update(m1, x=log(age+0.75), y=height)

## default plot options for xfun & yfun back-transform x & y to original scales
## xfun=ifun(x$call.sitar$x)
## yfun=ifun(x$call.sitar$y)
## compare mean curves for the two models where x & y are on the original scales
plot(m1, 'd', las=1)
lines(m2, 'd', col=2)



