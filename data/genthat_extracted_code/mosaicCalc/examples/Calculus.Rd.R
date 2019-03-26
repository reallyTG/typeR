library(mosaicCalc)


### Name: D
### Title: Derivative and Anti-derivative operators
### Aliases: D D.default D.formula antiD makeAntiDfun numerical_integration

### ** Examples

D(sin(t) ~ t)
D(A*sin(t) ~ t )
D(A*sin(2*pi*t/P) ~ t, A=2, P=10) # default values for parameters.
f <- D(A*x^3 ~ x + x, A=1) # 2nd order partial -- note, it's a function of x
f(x=2)
f(x=2,A=10) # override default value of parameter A
g <- D(f(x=t, A=1)^2 ~ t)  # note: it's a function of t
g(t=1)
gg <- D(f(x=t, A=B)^2 ~ t, B=10)  # note: it's a function of t and B
gg(t=1)
gg(t=1, B=100)
f <- makeFun(x^2~x)
D(f(cos(z))~z) #will look in user functions also
antiD( a*x^2 ~ x, a = 3)
antiD( A/x~x ) # This gives a warning about no default value for A
F <- antiD( A*exp(-k*t^2 ) ~ t, A=1, k=0.1)
F(t=Inf)
one = makeFun(1 ~ x + y)
by.x = antiD(one(x=x, y=y) ~ x, y=1)
by.xy = antiD(by.x(x = sqrt(1-y^2), y = y) ~ y)
4 * by.xy(y = 1) # area of quarter circle



