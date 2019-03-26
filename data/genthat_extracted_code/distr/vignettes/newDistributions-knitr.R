## ----knitRPreparations,include=FALSE-------------------------------------
library(knitr)
opts_chunk$set(tidy=FALSE)

## ----Prepa0, include=FALSE, results="hide"-------------------------------
require(distr)

## ----Prepa, echo=FALSE, results="asis"------------------------------
## preparation: set option withSweave to TRUE
require(distr)
distroptions(withSweave = TRUE)
options(width=70)

## ----exam1, eval = TRUE, fig.width=8.0, fig.height=6.5--------------
require(distr)
N <- Norm(mean = 2, sd = 1.3)
P <- Pois(lambda = 1.2)
Z <- 2*N + 3 + P
Z
plot(Z, panel.first = grid(), lwd=3)
p(Z)(0.4)
q(Z)(0.3)
## in RStudio or Jupyter IRKernel, use q.l(.)(.) instead of q(.)(.)
Zs <- r(Z)(50)
Zs

## ----DiscrDist, eval = TRUE-----------------------------------------
D <- DiscreteDistribution(supp = c(1,5,7,21), prob = c(0.1,0.1,0.6,0.2))
D
plot(D, panel.first = grid(lwd=2), lwd = 3)

## ----AbscDist, eval = TRUE------------------------------------------
AC <- AbscontDistribution(d = function(x) exp(-abs(x)^3), withStand = TRUE)
AC
plot(AC, panel.first = grid(lwd=2), lwd = 3)

## ----AllClass1, results="asis", echo=TRUE---------------------------
## Class: BinomParameter
setClass("BinomParameter",
          representation = representation(size = "numeric", prob = "numeric"),
          prototype = prototype(size = 1, prob = 0.5, name =
                      gettext("Parameter of a Binomial distribution")
                      ),
          contains = "Parameter"
          )

## ----AllClass2, results="asis", echo=TRUE---------------------------
## Class: binomial distribution
setClass("Binom",
          prototype = prototype(
                      r = function(n){ rbinom(n, size = 1,prob = 0.5) },
                      d = function(x, log = FALSE){
                              dbinom(x, size = 1, prob = 0.5, log = log)
                                          },
                      p = function(q, lower.tail = TRUE, log.p = FALSE ){
                              pbinom(q, size = 1, prob = 0.5,
                                     lower.tail = lower.tail, log.p = log.p)
                                          },
                      q = function(p, lower.tail = TRUE, log.p = FALSE ){
                              qbinom(p, size = 1, prob = 0.5,
                                     lower.tail = lower.tail, log.p = log.p)
                                          },
                      img = new("Naturals"),
                      param = new("BinomParameter"),
                      support = 0:1,
                      lattice = new("Lattice",
                                pivot = 0, width = 1, Length = 2, name =
                                gettext(
                                  "lattice of a Binomial distribution"
                                       )
                                ),
                     .logExact = TRUE,
                     .lowerExact = TRUE
                      ),
          contains = "LatticeDistribution"
          )

## ----BinomDist1, results="asis", echo=TRUE--------------------------
## Access Methods
setMethod("size", "BinomParameter", function(object) object@size)
setMethod("prob", "BinomParameter", function(object) object@prob)
## Replace Methods
setReplaceMethod("size", "BinomParameter",
                  function(object, value){ object@size <- value; object})
setReplaceMethod("prob", "BinomParameter",
                  function(object, value){ object@prob <- value; object})

## ----AllGenerics, results="asis", echo=TRUE-------------------------
if(!isGeneric("size"))
   setGeneric("size", function(object) standardGeneric("size"))
if(!isGeneric("prob"))
   setGeneric("prob", function(object) standardGeneric("prob"))

## ----BinomDist2, results="asis", echo=TRUE--------------------------
setValidity("BinomParameter", function(object){
  if(length(prob(object)) != 1)
    stop("prob has to be a numeric of length 1")
  if(prob(object) < 0)
    stop("prob has to be in [0,1]")
  if(prob(object) > 1)
    stop("prob has to be in [0,1]")
  if(length(size(object)) != 1)
    stop("size has to be a numeric of length 1")
  if(size(object) < 1)
    stop("size has to be a natural greater than 0")
  if(!identical(floor(size(object)), size(object)))
    stop("size has to be a natural greater than 0")
  else return(TRUE)
})

## ----BinomDist3, results="asis", echo=TRUE--------------------------
Binom <- function(size = 1,prob = 0.5) new("Binom", size = size, prob = prob)

## ----BinomDist4, results="asis", echo=TRUE--------------------------
## Convolution for two binomial distributions Bin(n1,p1) and Bin(n2,p2)
## Distinguish cases
## p1 == p2 und p1 != p2


setMethod("+", c("Binom","Binom"),
          function(e1,e2){
            newsize <- size(e1) + size(e2)

            if(isTRUE(all.equal(prob(e1),prob(e2))))
               return(new("Binom", prob = prob(e1), size = newsize,
                          .withArith = TRUE))

            return(as(e1, "LatticeDistribution") + e2)
          })

## ----Prepa2, echo=FALSE, results="asis"-----------------------------
## preparation: set option withSweave to TRUE
require(distrEx)

## ----Expect, results="asis", echo=TRUE------------------------------
setMethod("E", signature(object = "Binom",
                         fun = "missing",
                         cond = "missing"),
    function(object, low = NULL, upp = NULL, ...){
    if(!is.null(low)) if(low <= min(support(object))) low <- NULL
    if(!is.null(upp)) if(upp >= max(support(object))) upp <- NULL
    if(is.null(low) && is.null(upp))
        return(size(object)*prob(object))
    else{
        if(is.null(low)) low <- -Inf
        if(is.null(upp)) upp <- Inf
        if(low == -Inf){
           if(upp == Inf) return(size(object)*prob(object))
           else return(m1df(object, upper = upp, ...))
        }else{
           E1 <- m1df(object, upper = low, ...)
           E2 <- if(upp == Inf)
                    size(object)*prob(object) else m1df(object, upper = upp, ...)
           return(E2-E1)
        }
    }
   })

## ----var, results="asis", echo=TRUE---------------------------------
setMethod("var", signature(x = "Binom"),
    function(x,...){
    dots <- match.call(call = sys.call(sys.parent(1)),
                       expand.dots = FALSE)$"..."
    fun <- NULL; cond <- NULL; low <- NULL; upp <- NULL
    if(hasArg(low)) low <- dots$low
    if(hasArg(upp)) upp <- dots$upp
    if(hasArg(fun)||hasArg(cond)||!is.null(low)||!is.null(upp))
        return(var(as(x,"DiscreteDistribution"),...))
    else
        return(size(x)*prob(x)*(1-prob(x)))
    })

## ----skew, results="asis", echo=TRUE--------------------------------
setMethod("skewness", signature(x = "Binom"),
    function(x,  ...){
    dots <- match.call(call = sys.call(sys.parent(1)),
                       expand.dots = FALSE)$"..."
    fun <- NULL; cond <- NULL; low <- NULL; upp <- NULL
    if(hasArg(low)) low <- dots$low
    if(hasArg(upp)) upp <- dots$upp
    if(hasArg(fun)||hasArg(cond)||!is.null(low)||!is.null(upp))
       return(skewness(as(x,"DiscreteDistribution"),...))
    else
        return((1-2*prob(x))/sqrt(size(x)*prob(x)*(1-prob(x))))
    })

## ----kurt, results="asis", echo=TRUE--------------------------------
setMethod("kurtosis", signature(x = "Binom"),
    function(x,  ...){
    dots <- match.call(call = sys.call(sys.parent(1)),
                       expand.dots = FALSE)$"..."
    fun <- NULL; cond <- NULL; low <- NULL; upp <- NULL
    if(hasArg(low)) low <- dots$low
    if(hasArg(upp)) upp <- dots$upp
    if(hasArg(fun)||hasArg(cond)||!is.null(low)||!is.null(upp))
       return(kurtosis(as(x,"DiscreteDistribution"),...))
    else
        p <- prob(x)
        return((1-6*p*(1-p))/(size(x)*p*(1-p)))
    })

