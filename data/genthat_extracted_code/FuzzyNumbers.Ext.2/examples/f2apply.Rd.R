library(FuzzyNumbers.Ext.2)


### Name: f2apply
### Title: Apply a two-variable function on two fuzzy numbers
### Aliases: f2apply
### Keywords: fapply f2apply FuzzyNumbers monoton function is.increasing
###   is.decreasing is.increasing.on.x is.decreasing.on.x
###   is.increasing.on.y is.decreasing.on.y

### ** Examples


library(FuzzyNumbers)   # For Loud 'FuzzyNumbers' package, after its instalation

# Example 1: Four different cases of function (in respect to increasing/decreasing on x and y)
x = TriangularFuzzyNumber(1,2,5)
y = TrapezoidalFuzzyNumber(3,4,5,6)

g1 = function(x,y) 2*x+y
f2apply(x, y, g1, knot.n=5, type="l", I.O.plot=TRUE)
f2apply(x, y, g1, knot.n=10, xlim=c(0,18), col=4, type="b", I.O.plot=FALSE)
plot(2*x+y, col=2, lty=4, lwd=3, add=TRUE) #Compare the result from "FuzzyNumbers" package

g2 = function(x,y) -2*pnorm(x)+y
f2apply(x, y, g2, type="b")

g3 = function(x,y) 2*x-punif(y, min=1, max=8)
f2apply(x, y, g3, type="l")

g4 = function(x,y) -2*x-y^3
f2apply(x, y, g4, knot.n=20, type="b" )



# Example 2: 
knot.n = 10
A <- FuzzyNumber(-1, .5, 1, 3,
  lower=function(alpha) qbeta(alpha,0.4,3),
  upper=function(alpha) (1-alpha)^4
)
B = PowerFuzzyNumber(1,2,2.5,4, p.left=2, p.right=0.5)
f2apply(A, B, function(x,y) -2*x-y^3, knot.n=knot.n, type="l", col=2, lty=5, lwd=3, I.O.plot=FALSE)
f2apply(A, B, function(x,y) -2*x-y^3, knot.n=knot.n, type="l", col=2, lty=5, lwd=3)

# As another example, change the function and work with the cuts of result:
Result <- f2apply(A, B, function(x,y) abs(y+x-10),knot.n=knot.n,type="l",I.O.plot=TRUE,col=3,lwd=2)
Result
class(Result)

#The result of alphacut for alpha=0.444:
Result$cuts["0.444",] #Or equivalently,  
Result$cuts[6,]  

# Upper bounds of alphacuts:
Result$cuts[,"U"] #Or equivalently,  
Result$cuts[,2]

#The core of the result:
Result$core  

# The support of the result:
Result$support # Or, equivalently:  Result$s


# Example 3: 
knot.n = 10
x = PowerFuzzyNumber(0,1,1,1.3, p.left=1, p.right=1) 
y = PowerFuzzyNumber(3,4,4,6, p.left=1, p.right=1) 
f = function(x,y) 3*x - 2*y
f2apply(x, y, f, knot.n=knot.n, type="l", I.O.plot=TRUE)

g = function(x,y) exp(x^2) + 3*log(sqrt(y+4))
f2apply(x, y, g, knot.n=knot.n, type="l", I.O.plot=TRUE)


# Example 4: 
knot.n = 20
A = PowerFuzzyNumber(.1,.5,.5,.6, p.left=2, p.right=0.5)
B <- FuzzyNumber(.5, .6, .7, .9,
  lower=function(alpha) qbeta(alpha,0.4,3),
  upper=function(alpha) (1-alpha)^4
)
fun1 <- function(x,y) qnorm(x)-qgamma(y,2,4)
f2apply(A, B, fun1, knot.n=knot.n, type="l", I.O.plot=TRUE, col=2, lwd=2)

fun2 <- function(x,y) 0.3*sin(qnorm(x))+tan(qgamma(y,2,4))
f2apply(A, B, fun2, knot.n=knot.n, type="l", I.O.plot=TRUE)


# Example 5: It may be one of considered inputs are crisp.
knot.n = 10
A = 27
B = PowerFuzzyNumber(1,2,2.5,4, p.left=2, p.right=0.5)
f2apply(A, B, function(x,y) -2*x-y^3, knot.n=knot.n, I.O.plot=TRUE)

f2apply(x=4, y=3, function(x,y) sqrt(x)*y^2, knot.n=knot.n, I.O.plot=TRUE)
f2apply(x=4, y=TriangularFuzzyNumber(2,3,5), function(x,y) sqrt(x)-y^2,knot.n=knot.n,I.O.plot=TRUE)
f2apply(x=TriangularFuzzyNumber(2,4,6), y=3, function(x,y) sqrt(x)-y^2,knot.n=knot.n,I.O.plot=TRUE)
f2apply(x=TriangularFuzzyNumber(2,4,6), y=TriangularFuzzyNumber(2,3,5), function(x,y) sqrt(x)-y^2,
        knot.n=knot.n, I.O.plot=TRUE)


## The function is currently defined as
function (x, y, fun, knot.n = 10, I.O.plot = "TRUE", ...) 
{
    x.input <- x
    y.input <- y
    if (class(x) == "numeric") {
        x <- x.input.fuzzy <- TriangularFuzzyNumber(x, x, x)
    }
    if (class(x) == "TriangularFuzzyNumber" | class(x) == "TrapezoidalFuzzyNumber") {
        x.input.fuzzy <- x
        x <- as.PiecewiseLinearFuzzyNumber(x, knot.n)
    }
    if (class(x) == "FuzzyNumber" | class(x) == "PowerFuzzyNumber" |
        class(x) == "PiecewiseLinearFuzzyNumber"  ){
        x.input.fuzzy <- x
        x <- piecewiseLinearApproximation(x, method = "Naive")
    }
    if (class(y) == "numeric") {
        y <- y.input.fuzzy <- TriangularFuzzyNumber(y, y, y)
    }
    if (class(y) == "TriangularFuzzyNumber" | class(y) == "TrapezoidalFuzzyNumber") {
        y.input.fuzzy <- y
        y <- as.PiecewiseLinearFuzzyNumber(y, knot.n)
    }
    if (class(y) == "FuzzyNumber" | class(y) == "PowerFuzzyNumber" | 
        class(y) == "PiecewiseLinearFuzzyNumber"  ){
        y.input.fuzzy <- y
        y <- piecewiseLinearApproximation(y, method = "Naive")
    }
    step.x = length(supp(x))/30
    step.y = length(supp(y))/30
    if (class(x.input) == "numeric") {
        is.inc.on.x <- TRUE
        is.dec.on.x <- FALSE
    }
    else {
        is.inc.on.x = is.increasing.on.x(fun, x.bound = supp(x), 
            y.bound = supp(y), step.x)
        is.dec.on.x = is.decreasing.on.x(fun, x.bound = supp(x), 
            y.bound = supp(y), step.x)
    }
    if (class(y.input) == "numeric") {
        is.inc.on.y <- TRUE
        is.dec.on.y <- FALSE
    }
    else {
        is.inc.on.y = is.increasing.on.y(fun, x.bound = supp(x), 
            y.bound = supp(y), step.y)
        is.dec.on.y = is.decreasing.on.y(fun, x.bound = supp(x), 
            y.bound = supp(y), step.y)
    }
    if ((is.inc.on.x == TRUE) & (is.inc.on.y == TRUE)) {
        fun.rep = "fun is an increasing function from x and y on introduced bounds"
        L.result = fun(alphacut(x.input.fuzzy, seq(0, 1, len = knot.n))[, 
            "L"], alphacut(y.input.fuzzy, seq(0, 1, len = knot.n))[, 
            "L"])
        U.result = fun(alphacut(x.input.fuzzy, seq(0, 1, len = knot.n))[, 
            "U"], alphacut(y.input.fuzzy, seq(0, 1, len = knot.n))[, 
            "U"])
        result = c(L.result, U.result[length(U.result):1])
    }
    else {
        if ((is.dec.on.x == TRUE) & (is.inc.on.y == TRUE)) {
    fun.rep = "fun is a decreasing function on x and increasing function on y on introduced bounds"
            L.result = fun(alphacut(x.input.fuzzy, seq(0, 1, 
                len = knot.n))[, "U"], alphacut(y.input.fuzzy, 
                seq(0, 1, len = knot.n))[, "L"])
            U.result = fun(alphacut(x.input.fuzzy, seq(0, 1, 
                len = knot.n))[, "L"], alphacut(y.input.fuzzy, 
                seq(0, 1, len = knot.n))[, "U"])
            result = c(L.result, U.result[length(U.result):1])
        }
        else {
            if ((is.inc.on.x == TRUE) & (is.dec.on.y == TRUE)) {
   fun.rep = "fun is an increasing function on x and decreasing function on y on introduced bounds"
                L.result = fun(alphacut(x.input.fuzzy, seq(0, 
                  1, len = knot.n))[, "L"], alphacut(y.input.fuzzy, 
                  seq(0, 1, len = knot.n))[, "U"])
                U.result = fun(alphacut(x.input.fuzzy, seq(0, 
                  1, len = knot.n))[, "U"], alphacut(y.input.fuzzy, 
                  seq(0, 1, len = knot.n))[, "L"])
                result = c(L.result, U.result[length(U.result):1])
            }
            else {
                if ((is.dec.on.x == TRUE) & (is.dec.on.y == TRUE)) {
                  fun.rep = "fun is a decreasing function from x and y on introduced bounds"
                  L.result = fun(alphacut(x.input.fuzzy, seq(0, 
                    1, len = knot.n))[, "U"], alphacut(y.input.fuzzy, 
                    seq(0, 1, len = knot.n))[, "U"])
                  U.result = fun(alphacut(x.input.fuzzy, seq(0, 
                    1, len = knot.n))[, "L"], alphacut(y.input.fuzzy, 
                    seq(0, 1, len = knot.n))[, "L"])
                  result = c(L.result, U.result[length(U.result):1])
                }
                else {
                  return(print("fun is not a monoton function on x and y for the introduced bounds.
                                Therefore this function is not appliable for computation."))
                }
            }
        }
    }
    if (class(x.input) == "numeric" | class(y.input) == "numeric") {
        fun.rep = "supports of one/both inputted points are crisp and the exact report on function
                   is not needed"
    }
    Alphacuts = c(seq(0, 1, len = knot.n), seq(1, 0, len = knot.n))
    if (I.O.plot == TRUE) {
        op <- par(mfrow = c(3, 1))
        if (class(x.input) == "numeric") {
            plot(TriangularFuzzyNumber(x.input, x.input, x.input), 
                ylab = "membership func. of x")
        }
        else {
            plot(x.input, ylab = "membership func. of x")
        }
        if (class(y.input) == "numeric") {
            plot(TriangularFuzzyNumber(y.input, y.input, y.input), 
                xlab = "y", ylab = "membership func. of y")
        }
        else {
            plot(y.input, col = 1, xlab = "y", ylab = "membership func. of y")
        }
        plot(result, Alphacuts, xlab = "fun(x,y)", ylab = "membership func. of fun(x,y)", 
            ...)
        abline(v = fun(core(x), core(y)), lty = 3)
        par(op)
    }
    if (I.O.plot == "FALSE") {
        plot(result, Alphacuts, xlab = "fun(x,y)", ylab = "membership func. of fun(x,y)", 
            ...)
    }
    result2 <- c(L.result[length(L.result):1], U.result[length(U.result):1])
    cuts <- matrix(result2, ncol = 2, byrow = FALSE, dimnames = list(round((length(L.result) - 
        1):0/(length(L.result) - 1), 3), c("L", "U")))
    return(list(fun.rep = noquote(fun.rep), cuts = cuts, core = cuts[1, 
        ], support = cuts[dim(cuts)[1], ]))
  }



