library(nlsr)

# Various derivatives 

fnDeriv(quote(1 + x + y), c("x", "y"))

nlsDeriv( ~ log(x), "x")
nlsDeriv( ~ log(x, base=3), "x" )

nlsDeriv( ~ exp(x), "x")
nlsDeriv( ~ sin(x), "x")
nlsDeriv( ~ cos(x), "x")
nlsDeriv( ~ tan(x), "x")
nlsDeriv( ~ sinh(x), "x")
nlsDeriv( ~ cosh(x), "x")
nlsDeriv( ~ sqrt(x), "x")
nlsDeriv( ~ pnorm(q), "q")
nlsDeriv( ~ dnorm(x, mean), "mean")
nlsDeriv( ~ asin(x), "x")
nlsDeriv( ~ acos(x), "x")
nlsDeriv( ~ atan(x), "x")
nlsDeriv( ~ gamma(x), "x")
nlsDeriv( ~ lgamma(x), "x")
nlsDeriv( ~ digamma(x), "x")
nlsDeriv( ~ trigamma(x), "x")
nlsDeriv( ~ psigamma(x, deriv = 5), "x")
nlsDeriv( ~ x*y, "x")
nlsDeriv( ~ x/y, "x")
nlsDeriv( ~ x^y, "x")
nlsDeriv( ~ (x), "x")
nlsDeriv( ~ +x, "x")
nlsDeriv( ~ -x, "x")
nlsDeriv( ~ abs(x), "x")
nlsDeriv( ~ sign(x), "x")

# This was wrong...

nlsDeriv(expression(y), c("x", "y"))

# Various simplifications

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

# This one was wrong...
nlsSimplify(quote(--(a+b)))
