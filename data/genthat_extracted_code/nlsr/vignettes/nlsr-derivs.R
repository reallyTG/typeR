## ----chunk01-------------------------------------------------------------
dx2x <- deriv(~ x^2, "x") 
dx2x
mode(dx2x)
str(dx2x)
x <- -1:2
eval(dx2x) # This is evaluated at -1, 0, 1, 2, with the result in the "gradient" attribute
# Note that we cannot (easily) differentiate this again.
firstd <- attr(dx2x,"gradient")
str
#  ... and the following gives an error
d2x2x <- try(deriv(firstd, "x"))
str(d2x2x)
#- Build a function from the expression
fdx2x<-function(x){eval(dx2x)}
fdx2x(1)
fdx2x(3.21)
fdx2x(1:5)
#- # Now try D()
Dx2x <- D(expression(x^2), "x")
Dx2x
x <- -1:2
eval(Dx2x)
# We can differentiate aggain
D2x2x <- D(Dx2x,"x")
D2x2x
eval(D2x2x) #- But we don't get a vector -- could be an issue in gradients/Jacobians
#- Note how we handle an expression stored in a string via parse(text=  ))
sx2 <- "x^2"
sDx2x <- D(parse(text=sx2), "x")
sDx2x
#- But watch out! The following "seems" to work, but the answer is not as intended.  The problem is that the first
# argument is evaluated before being used.  Since 
# x exists, it fails
x
Dx2xx <- D(x^2, "x")
Dx2xx
eval(Dx2xx)
#-  Something 'tougher':
trig.exp <- expression(sin(cos(x + y^2)))
( D.sc <- D(trig.exp, "x") )
all.equal(D(trig.exp[[1]], "x"), D.sc)
( dxy <- deriv(trig.exp, c("x", "y")) )
y <- 1
eval(dxy)
eval(D.sc)
#-  function returned:
deriv((y ~ sin(cos(x) * y)), c("x","y"), func = TRUE)
#- ??#-  Surely there is an error, since documentation says no lhs! i.e.,
#- "expr: a 'expression' or 'call' or (except 'D') a formula with no lhs."
#-  function with defaulted arguments:
(fx <- deriv(y ~ b0 + b1 * 2^(-x/th), c("b0", "b1", "th"),
             function(b0, b1, th, x = 1:7){} ) )
fx(2, 3, 4)
#-  First derivative
D(expression(x^2), "x")
#-  stopifnot(D(as.name("x"), "x") == 1) #- A way of testing. 
#- This works by coercing "x" to name/symbol, and derivative should be 1.
#- Would fail only if "x" cannot be so coerced. How could this happen??
#-  Higher derivatives showing deriv3
myd3 <- deriv3(y ~ b0 + b1 * 2^(-x/th), c("b0", "b1", "th"),
     c("b0", "b1", "th", "x") )
myd3(2,3,4, x=1:7)
#- check against deriv()
myd3a <- deriv(y ~ b0 + b1 * 2^(-x/th), c("b0", "b1", "th"),
     c("b0", "b1", "th", "x"), hessian=TRUE )
myd3a(2,3,4, x=1:7)
identical(myd3a, myd3) #- Remember to check things!

#-  Higher derivatives:
DD <- function(expr, name, order = 1) {
   if(order < 1) stop("'order' must be >= 1")
   if(order == 1) D(expr, name)
   else DD(D(expr, name), name, order - 1)
}
DD(expression(sin(x^2)), "x", 3)
#-  showing the limits of the internal "simplify()" :
#-  -sin(x^2) * (2 * x) * 2 + ((cos(x^2) * (2 * x) * (2 * x) + sin(x^2) *
#-     2) * (2 * x) + sin(x^2) * (2 * x) * 2)

## ----chunk02-------------------------------------------------------------
require(nlsr)
dx2xn <- nlsDeriv(~ x^2, "x")
dx2xn
mode(dx2xn)
str(dx2xn)
x <- -1:2
eval(dx2xn) # This is evaluated at -1, 0, 1, 2, BUT result is returned directly,
#-  NOT in "gradient" attribute
firstdn <- dx2xn
str(firstdn)
d2x2xn <- nlsDeriv(firstdn, "x")
d2x2xn
d2x2xnF <- nlsDeriv(firstdn, "x", do_substitute=FALSE)
d2x2xnF # in this case we get the same result
d2x2xnT <- nlsDeriv(firstdn, "x", do_substitute=TRUE)
d2x2xnT # 0 ## WATCH OUT

#- ?? We can iterate the derivatives
nlsDeriv(d2x2xn, "x")

nlsDeriv(x^2, "x")# 0
nlsDeriv(x^2, "x", do_substitute=FALSE)# 0
nlsDeriv(x^2, "x", do_substitute=TRUE) # 2 * x
nlsDeriv(~ x^2, "x") # 2 * x
nlsDeriv(~ x^2, "x", do_substitute=FALSE) # 2 * x
nlsDeriv(~ x^2, "x", do_substitute=TRUE) # 2 * x

#?? firstde <- quote(firstd)
#?? firstde
#?? firstde <- bquote(firstd)
#?? firstde
#?? nlsDeriv(firstde, "x")
d2 <- nlsDeriv(2 * x, "x")
str(d2)
d2
#?? firstc <- as.call(firstd)
#?? nlsDeriv(firstc, "x")
#- Build a function from the expression
#?? fdx2xn<-function(x){eval(dx2xn)}
#?? fdx2xn(1)
#?? fdx2xn(3.21)
#?? fdx2xn(1:5)

## ----chunk03-------------------------------------------------------------
codeDeriv(parse(text="b0 + b1 * 2^(-x/th)"), c("b0", "b1", "th")) 
#- Include parameters as arguments
fj.1 <- fnDeriv(parse(text="b0 + b1 * 2^(-x/th)"), c("b0", "b1", "th")) 
head(fj.1)
fj.1(1,2,3,4)
#- Get all parameters from the calling environment
fj.2 <- fnDeriv(parse(text="b0 + b1 * 2^(-x/th)"), c("b0", "b1", "th"),
        args = character())
head(fj.2)
b0 <- 1
b1 <- 2
x <- 3
th <- 4 
fj.2()

#- Just use an expression
fje <- codeDeriv(parse(text="b0 + b1 * 2^(-x/th)"), c("b0", "b1", "th"))
eval(fje)

dx2xnf <- fnDeriv(~ x^2, "x") #- Use tilde
dx2xnf <- fnDeriv(expression(x^2), "x") #- or use expression()
dx2xnf
mode(dx2xnf)
str(dx2xnf)
x <- -1:2
#?? eval(dx2xnf) # This is evaluated at -1, 0, 1, 2, BUT result is returned directly,
#-  NOT in "gradient" attribute
# Note that we cannot (easily) differentiate this again.
# firstd <- dx2xnf
# str(firstd)
# d2x2xnf <- try(nlsDeriv(firstd, "x")) #- this APPEARS to work, but WRONG answer 
# str(d2x2xnf)
# d2x2xnf
# eval(d2x2xnf)

# dx2xnfh <- fnDeriv(expression(x^2), "x", hessian=TRUE) #- Try for second derivatives
# dx2xnfh
# mode(dx2xnfh)
# str(dx2xnfh)
# x <- -1
# eval(dx2xnfh) # This is evaluated at -1, 0, 1, 2, BUT result is returned directly,

## ----chunk04-------------------------------------------------------------
require(Deriv)

f <- function(x) x^2
Deriv(f)
#- Should see
#- function (x)
#- 2 * x
#- Now save the derivative
f1 <- Deriv(f)
f1 #- print it
f2 <- Deriv(f1) #- and take second derivative
f2 #- print it

f <- function(x, y) sin(x) * cos(y)
f_ <- Deriv(f)
f_ #- print it
#- Should see
#- function (x, y)
#- c(x = cos(x) * cos(y), y = -(sin(x) * sin(y)))
f_(3, 4)
#- Should see
#-              x         y
#- [1,] 0.6471023 0.1068000

f2 <- Deriv(~ f(x, y^2), "y") #- This has a tilde to render the 1st argument as a formula object
#- Also we are substituting in y^2 for y
f2 #- print it
#- -(2 * (y * sin(x) * sin(y^2)))
mode(f2) #- check what type of object it is
arg1 <- ~ f(x,y^2)
mode(arg1) #- check the type
f2a <- Deriv(arg1, "y")
f2a #- and print to see if same as before
#- try evaluation of f using current x and y
x
y
f(x,y^2)
eval(f2a) #- We need x and y defined to do this.

f3 <- Deriv(quote(f(x, y^2)), c("x", "y"), cache.exp=FALSE) #- check cache.exp operation
#- Note that we need to quote or will get evaluation at current x, y values (if they exist)
f3 #- print it
#- c(x = cos(x) * cos(y^2), y = -(2 * (y * sin(x) * sin(y^2))))
f3c <- Deriv(quote(f(x, y^2)), c("x", "y"), cache.exp=TRUE) #- check cache.exp operation
f3c #- print it
#- Now want to evaluate the results
#- First must provide some data
x <- 3
y <- 4
eval(f3c)
#- Should see
#- x         y 
#- 0.9480757 0.3250313 
eval(f3) #- check this also
#- or we can create functions
f3cf <- function(x, y){eval(f3c)}
f3cf(x=1, y=2)
#-          x          y 
#- -0.3531652  2.5473094 
f3f <- function(x,y){eval(f3)}
f3f(x=3, y=4)
#-         x         y 
#- 0.9480757 0.3250313 

#- try an expression
Deriv(expression(sin(x^2) * y), "x")
#- should see
#- expression(2 * (x * y * cos(x^2)))

#- quoted string
Deriv("sin(x^2) * y", "x") # differentiate only by x
#- Should see
#- "2 * (x * y * cos(x^2))"

Deriv("sin(x^2) * y", cache.exp=FALSE) #- differentiate by all variables (here by x and y)
#- Note that default is to differentiate by all variables.
#- Should see
#- "c(x = 2 * (x * y * cos(x^2)), y = sin(x^2))"

#- Compound function example (here abs(x) smoothed near 0)
#- Note that this introduces the possibilty of `if` statements in the code
#- BUT (JN) seems to give back quoted string, so we must parse.
fc <- function(x, h=0.1) if (abs(x) < h) 0.5*h*(x/h)**2 else abs(x)-0.5*h
efc1 <- Deriv("fc(x)", "x", cache.exp=FALSE) 
#- "if (abs(x) < h) x/h else sign(x)"
#- A few checks on the results
efc1

fc1 <- function(x,h=0.1){ eval(parse(text=efc1)) }
fc1
## h=0.1
fc1(1)
fc1(0.001)
fc1(-0.001)
fc1(-10)
fc1(0.001, 1)

#- Example of a first argument that cannot be evaluated in the current environment:
  try(suppressWarnings(rm("xx", "yy"))) #- Make sure there are no objects xx or yy
  Deriv(~ xx^2+yy^2)
#- Should show
#- c(xx = 2 * xx, yy = 2 * yy)
#- ?? What is the meaning / purpose of this construct?
  
#- ?? Is following really AD?  
#- Automatic differentiation (AD), note intermediate variable 'd' assignment
Deriv(~{d <- ((x-m)/s)^2; exp(-0.5*d)}, "x")
# Note that the result we see does NOT match what follows in the example(Deriv) (JN ??)
#{
#   d <- ((x - m)/s)^2
#   .d_x <- 2 * ((x - m)/s^2)
#   -(0.5 * (.d_x * exp(-(0.5 * d))))
#}
#- For some reason the intermediate variable d is NOT included.??


#- Custom derivative rule. Note that this needs explanations??
  myfun <- function(x, y=TRUE) NULL #- do something useful
  dmyfun <- function(x, y=TRUE) NULL #- myfun derivative by x.
  drule[["myfun"]] <- alist(x=dmyfun(x, y), y=NULL) #- y is just a logical
  Deriv(myfun(z^2, FALSE), "z")
  # 2 * (z * dmyfun(z^2, FALSE))

#- Differentiation by list components
  theta <- list(m=0.1, sd=2.) #- Why do we set values??
  x <- names(theta) #- and why these particular names??
  names(x)=rep("theta", length(theta))
  Deriv(~exp(-(x-theta$m)**2/(2*theta$sd)), x, cache.exp=FALSE)
#- Should show the following (but why??)
#- c(theta_m = exp(-((x - theta$m)^2/(2 * theta$sd))) *
#-  (x - theta$m)/theta$sd, theta_sd = 2 * (exp(-((x - theta$m)^2/
#-  (2 * theta$sd))) * (x - theta$m)^2/(2 * theta$sd)^2))
lderiv <-  Deriv(~exp(-(x-theta$m)**2/(2*theta$sd)), x, cache.exp=FALSE)
fld <- function(x){ eval(lderiv)} #- put this in a function
fld(2) #- and evaluate at a value

## ----chunk05-------------------------------------------------------------
library(Deriv)
rm(x) # ensures x is undefined
Deriv(~ x, "x")  # returns [1] 1 -- clearly a bug!
Deriv(~ x^2, "x")   # returns 2 * x
x <- quote(x^2)
Deriv(x, "x") # returns 2 * x

## ----chunk06-------------------------------------------------------------
rm(x) # in case it is defined
library(nlsr)
try(nlsDeriv(x, "x")  ) # fails, not a formula
try(nlsDeriv(as.expression("x"), "x")  ) # expression(NULL)
try(nlsDeriv(~x, "x")  ) # 1
try(nlsDeriv(x^2, "x"))   # fails
try(nlsDeriv(~x^2, "x")) # 2 * x
x <- quote(x^2)
try(nlsDeriv(x, "x")) # returns 2 * x

## ----chunk07, eval = require(Ryacas)-------------------------------------
require(nlsr)
dnlsr <- nlsr::nlsDeriv(~ sin(x+y), "x")
print(dnlsr)
class(dnlsr)
detach("package:nlsr", unload=TRUE)
detach("package:Deriv", unload=TRUE)

x <- Sym("x")
y <- Sym("y")
dryacas <- deriv(sin(x+y), x)
print(dryacas)
class(dryacas)

detach("package:Ryacas", unload=TRUE)

## ----chunk08-------------------------------------------------------------
ls(nlsr::sysDerivs)

## ----chunk09-------------------------------------------------------------
require(nlsr)
## Try different ways to supply the log function
aDeriv <- nlsDeriv(~ log(x), "x")
class(aDeriv)
aDeriv
aderiv <- try(deriv( ~ log(x), "x"))
class(aderiv)
aderiv
aD <- D(expression(log(x)), "x")
class(aD)
aD
cat("but \n")
try(D( "~ log(x)", "x")) # fails -- gives NA rather than expected answer due to quotes
try(D( ~ log(x), "x"))
interm <- ~ log(x)
interm
class(interm)
interme <- as.expression(interm)
class(interme)
try(D(interme, "x"))
try(deriv(interme, "x"))
try(deriv(interm, "x"))


nlsDeriv(~ log(x, base=3), "x" ) # OK
try(D(expression(log(x, base=3)), "x" )) # fails - only single-argument calls supported
try(deriv(~ log(x, base=3), "x" )) # fails - only single-argument calls supported
try(deriv(expression(log(x, base=3)), "x" )) # fails - only single-argument calls supported
try(deriv3(expression(log(x, base=3)), "x" )) # fails - only single-argument calls supported
fnDeriv(quote(log(x, base=3)), "x" )

nlsDeriv(~ exp(x), "x")
D(expression(exp(x)), "x") # OK
deriv(~exp(x), "x") # OK, but much more complicated
fnDeriv(quote(exp(x)), "x")

nlsDeriv(~ sin(x), "x")
D(expression(sin(x)), "x")
deriv(~sin(x), "x")
fnDeriv(quote(sin(x)), "x")

nlsDeriv(~ cos(x), "x")
D(expression(cos(x)), "x")
deriv(~ cos(x), "x")
fnDeriv(quote(cos(x)), "x")

nlsDeriv(~ tan(x), "x")
D(expression(tan(x)), "x")
deriv(~ tan(x), "x")
fnDeriv(quote(tan(x)), "x")

nlsDeriv(~ sinh(x), "x")
D(expression(sinh(x)), "x")
deriv(~sinh(x), "x")
fnDeriv(quote(sinh(x)), "x")

nlsDeriv(~ cosh(x), "x")
D(expression(cosh(x)), "x")
deriv(~cosh(x), "x")
fnDeriv(quote(cosh(x)), "x")

nlsDeriv(~ sqrt(x), "x")
D(expression(sqrt(x)), "x")
deriv(~sqrt(x), "x")
fnDeriv(quote(sqrt(x)), "x")

nlsDeriv(~ pnorm(q), "q")
D(expression(pnorm(q)), "q")
deriv(~pnorm(q), "q")
fnDeriv(quote(pnorm(q)), "q")

nlsDeriv(~ dnorm(x, mean), "mean")
D(expression(dnorm(x, mean)), "mean")
deriv(~dnorm(x, mean), "mean")
fnDeriv(quote(dnorm(x, mean)), "mean")

nlsDeriv(~ asin(x), "x")
D(expression(asin(x)), "x")
deriv(~asin(x), "x")
fnDeriv(quote(asin(x)), "x")

nlsDeriv(~ acos(x), "x")
D(expression(acos(x)), "x")
deriv(~acos(x), "x")
fnDeriv(quote(acos(x)), "x")

nlsDeriv(~ atan(x), "x")
D(expression(atan(x)), "x")
deriv(~atan(x), "x")
fnDeriv(quote(atan(x)), "x")

nlsDeriv(~ gamma(x), "x")
D(expression(gamma(x)), "x")
deriv(~gamma(x), "x")
fnDeriv(quote(gamma(x)), "x")

nlsDeriv(~ lgamma(x), "x")
D(expression(lgamma(x)), "x")
deriv(~lgamma(x), "x")
fnDeriv(quote(lgamma(x)), "x")

nlsDeriv(~ digamma(x), "x")
D(expression(digamma(x)), "x")
deriv(~digamma(x), "x")
fnDeriv(quote(digamma(x)), "x")

nlsDeriv(~ trigamma(x), "x")
D(expression(trigamma(x)), "x")
deriv(~trigamma(x), "x")
fnDeriv(quote(trigamma(x)), "x")

nlsDeriv(~ psigamma(x, deriv = 5), "x")
D(expression(psigamma(x, deriv = 5)), "x")
deriv(~psigamma(x, deriv = 5), "x")
fnDeriv(quote(psigamma(x, deriv = 5)), "x")

nlsDeriv(~ x*y, "x")
D(expression(x*y), "x")
deriv(~x*y, "x")
fnDeriv(quote(x*y), "x")

nlsDeriv(~ x/y, "x")
D(expression(x/y), "x")
deriv(~x/y, "x")
fnDeriv(quote(x/y), "x")

nlsDeriv(~ x^y, "x")
D(expression(x^y), "x")
deriv(~x^y, "x")
fnDeriv(quote(x^y), "x")

nlsDeriv(~ (x), "x")
D(expression((x)), "x")
deriv(~(x), "x")
fnDeriv(quote((x)), "x")

nlsDeriv(~ +x, "x")
D(expression(+x), "x")
deriv(~ +x, "x")
fnDeriv(quote(+x), "x")

nlsDeriv(~ -x, "x")
D(expression(- x), "x")
deriv(~ -x, "x")
fnDeriv(quote(-x), "x")

nlsDeriv(~ abs(x), "x")
try(D(expression(abs(x)), "x")) # 'abs' not in derivatives table
try(deriv(~ abs(x), "x"))
fnDeriv(quote(abs(x)), "x")

nlsDeriv(~ sign(x), "x")
try(D(expression(sign(x)), "x")) # 'sign' not in derivatives table
try(deriv(~ sign(x), "x"))
fnDeriv(quote(sign(x)), "x")

## ----chunk10-------------------------------------------------------------
ls(nlsr::sysSimplifications)

## ----chunk11-------------------------------------------------------------
#- Remove ##? to see reproducible error
#- ?? For some reason, if we leave packages attached, we get errors.
#- Here we detach all the non-base packages and then reload nlsr
##? require(nlsr)
##? sessionInfo()
##? ##? nlsSimplify(quote(+(a+b)))
##? nlsSimplify(quote(-5))

## ----chunk12-------------------------------------------------------------
#- ?? For some reason, if we leave packages attached, we get errors.
#- Here we detach all the non-base packages and then reload nlsr
sessionInfo()
if ("Deriv" %in% loadedNamespaces()){detach("package:Deriv", unload=TRUE)} 
  #- ?? Do we need to unload too.
if ("nlsr" %in% loadedNamespaces() ){detach("package:nlsr", unload=TRUE)}
if ("Ryacas" %in% loadedNamespaces() ){detach("package:Ryacas", unload=TRUE)}
require(nlsr)
#- require(Deriv)
#- require(stats)
#- Various simplifications
#- ?? Do we need quote() to stop attempt to evaluate before applying simplification

nlsSimplify(quote(+(a+b)))
nlsSimplify(quote(-5))
nlsSimplify(quote(--(a+b)))

nlsSimplify(quote(exp(log(a+b))))
nlsSimplify(quote(exp(1)))

nlsSimplify(quote(log(exp(a+b))))
nlsSimplify(quote(log(1)))

nlsSimplify(quote(!TRUE))
nlsSimplify(quote(!FALSE))

nlsSimplify(quote((a+b)))

nlsSimplify(quote(a + b + 0))
nlsSimplify(quote(0 + a + b))
nlsSimplify(quote((a+b) + (a+b)))
nlsSimplify(quote(1 + 4))

nlsSimplify(quote(a + b - 0))
nlsSimplify(quote(0 - a - b))
nlsSimplify(quote((a+b) - (a+b)))
nlsSimplify(quote(5 - 3))

nlsSimplify(quote(0*(a+b)))
nlsSimplify(quote((a+b)*0))
nlsSimplify(quote(1L * (a+b)))
nlsSimplify(quote((a+b) * 1))
nlsSimplify(quote((-1)*(a+b)))
nlsSimplify(quote((a+b)*(-1)))
nlsSimplify(quote(2*5))

nlsSimplify(quote((a+b) / 1))
nlsSimplify(quote((a+b) / (-1)))
nlsSimplify(quote(0/(a+b)))
nlsSimplify(quote(1/3))

nlsSimplify(quote((a+b) ^ 1))
nlsSimplify(quote(2^10))

nlsSimplify(quote(log(exp(a), 3)))

nlsSimplify(quote(FALSE && b))
nlsSimplify(quote(a && TRUE))
nlsSimplify(quote(TRUE && b))

nlsSimplify(quote(a || TRUE))
nlsSimplify(quote(FALSE || b))
nlsSimplify(quote(a || FALSE))

nlsSimplify(quote(if (TRUE) a+b))
nlsSimplify(quote(if (FALSE) a+b))

nlsSimplify(quote(if (TRUE) a+b else a*b))
nlsSimplify(quote(if (FALSE) a+b else a*b))
nlsSimplify(quote(if (cond) a+b else a+b))

nlsSimplify(quote(--(a+b)))
nlsSimplify(quote(-(-(a+b))))

## ----chunk13-------------------------------------------------------------
#- ?? For some reason, if we leave packages attached, we get errors.
#- Here we detach all the non-base packages and then reload nlsr
sessionInfo()
if ("Deriv" %in% loadedNamespaces()){detach("package:Deriv", unload=TRUE)} 
  #- ?? Do we need to unload too.
if ("Deriv" %in% loadedNamespaces() ){detach("package:nlsr", unload=TRUE)}
if ("Deriv" %in% loadedNamespaces() ){detach("package:Ryacas", unload=TRUE)}
require(Deriv)
#- Various simplifications
#- ?? Do we need quote() to stop attempt to evaluate before applying simplification

Simplify(quote(+(a+b)))
Simplify(quote(-5))
Simplify(quote(--(a+b)))

Simplify(quote(exp(log(a+b))))
Simplify(quote(exp(1)))

Simplify(quote(log(exp(a+b))))
Simplify(quote(log(1)))

Simplify(quote(!TRUE))
Simplify(quote(!FALSE))

Simplify(quote((a+b)))

Simplify(quote(a + b + 0))
Simplify(quote(0 + a + b))
Simplify(quote((a+b) + (a+b)))
Simplify(quote(1 + 4))

Simplify(quote(a + b - 0))
Simplify(quote(0 - a - b))
Simplify(quote((a+b) - (a+b)))
Simplify(quote(5 - 3))

Simplify(quote(0*(a+b)))
Simplify(quote((a+b)*0))
Simplify(quote(1L * (a+b)))
Simplify(quote((a+b) * 1))
Simplify(quote((-1)*(a+b)))
Simplify(quote((a+b)*(-1)))
Simplify(quote(2*5))

Simplify(quote((a+b) / 1))
Simplify(quote((a+b) / (-1)))
Simplify(quote(0/(a+b)))
Simplify(quote(1/3))

Simplify(quote((a+b) ^ 1))
Simplify(quote(2^10))

Simplify(quote(log(exp(a), 3)))

Simplify(quote(FALSE && b))
Simplify(quote(a && TRUE))
Simplify(quote(TRUE && b))

Simplify(quote(a || TRUE))
Simplify(quote(FALSE || b))
Simplify(quote(a || FALSE))

Simplify(quote(if (TRUE) a+b))
Simplify(quote(if (FALSE) a+b))

Simplify(quote(if (TRUE) a+b else a*b))
Simplify(quote(if (FALSE) a+b else a*b))
Simplify(quote(if (cond) a+b else a+b))

#- This one is wrong... the double minus is an error, yet it works ??.
Simplify(quote(--(a+b)))
#- By comparison
Simplify(quote(-(-(a+b))))

## ----chunk14-------------------------------------------------------------
require(nlsr)
dlogx <- nlsr::nlsDeriv(~ log(x), "x")
str(dlogx)
print(dlogx)

## ----chunk15-------------------------------------------------------------
require(nlsr)
dlogxs <- nlsr::nlsDeriv(expression(log(x)), "x", do_substitute=FALSE)
str(dlogxs)
print(dlogxs)
cat(as.character(dlogxs), "\n")
fne <- expression(log(x))
dlogxe <- nlsr::nlsDeriv(fne, "x", do_substitute=FALSE)
str(dlogxe)
print(dlogxe)


# base R
dblogx <- D(expression(log(x)), "x")
str(dblogx)
print(dblogx)

require(Deriv)
ddlogx <- Deriv::Deriv(expression(log(x)), "x")
str(ddlogx)
print(ddlogx)
cat(as.character(ddlogx), "\n")
ddlogxf <- ~ ddlogx
str(ddlogxf)

## ----chunk16-------------------------------------------------------------
require(nlsr)
# require(stats)
# require(Deriv)
# require(Ryacas)

# Various derivatives 

new <- codeDeriv(quote(1 + x + y), c("x", "y"))
old <- deriv(quote(1 + x + y), c("x", "y"))
print(new)
# Following generates a very long line on output of knitr (for markdown)
class(new)
str(new)
as.expression(new)
newf <- function(x, y){
   eval(new)
}
newf(3,5)

print(old)
class(old)
str(old)
oldf <- function(x,y){
    eval(old)
}
oldf(3,5)



## ----chunk17-------------------------------------------------------------
fnfromnew <- function(x,y){
    .value <- 1 + x + y
    .grad <- array(0, c(length(.value), 2L), list(NULL, c("x", 
    "y")))
    .grad[, "x"] <- 1
    .grad[, "y"] <- 1
    attr(.value, "gradient") <- .grad
    .value
}

print(fnfromnew(3,5))


## ----chunk18-------------------------------------------------------------
x <- NA
y <- Inf
print(eval(new))
print(eval(old))

## ----chunk19-------------------------------------------------------------
safeD <- function(obj, var) {
   # safeguarded D() function for symbolic derivs
   if (! is.character(var) ) stop("The variable var MUST be character type")
   if (is.character(obj) ) {
       eobj <- parse(text=obj)
       result <- D(eobj, var)
   } else {
       result <- D(obj, var)
   }
}

lxy2 <- expression(log(x+y^2))
clxy2 <- "log(x+y^2)"
try(print(D(clxy2, "y")))
print(try(D(lxy2, "y")))
print(safeD(clxy2, "y"))
print(safeD(lxy2, "y"))

## ----chunk20-------------------------------------------------------------
zzz <- expression(y[3]*r1 + r2)
try(deriv(zzz,c("r1","r2")))
require(nlsr)
try(nlsr::nlsDeriv(zzz, c("r1","r2")))
try(fnDeriv(zzz, c("r1","r2")))
newDeriv(`[`(x,y), stop("no derivative when indexing"))
try(nlsr::nlsDeriv(zzz, c("r1","r2")))
try(nlsr::fnDeriv(zzz, c("r1","r2")))

## ----chunk21-------------------------------------------------------------
try(nlsr::nlsDeriv(zzz, "y[3]"))
try(nlsr::nlsDeriv(y3*r1+r2,"y3"))
try(nlsr::nlsDeriv(y[3]*r1+r2,"y[3]"))

