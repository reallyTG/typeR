## ----message=FALSE-------------------------------------------------------
library(mistr)

## ------------------------------------------------------------------------
unifdist <- function(min = 0, max = 1){
  if (!is.numeric(min) || !is.numeric(max)){
    stop("parameters must be a numeric")
  } 
  if (min >= max){
    stop("min must be smaller than max")
  } 
  x <- list(parameters = list(min = min, max = max),
            type = "Uniform",
            support = list(from = min, to = max))
  class(x) <- c("unifdist", "contdist", "standist",
                "univdist", "dist")
  x
}


## ------------------------------------------------------------------------
dunifdist <- function(min = 1, max = 6){
  if (!is.numeric(min) || !is.numeric(max)){
    stop("parameters must be a numeric")
  } 
  if (min >= max){
    stop("min must be smaller than max")
  } 
  if (min%%1 != 0 || max%%1 != 0){
    stop("min and max must be integers")
  } 
  new_dist(name = "Discrete uniform", 
           from = min, to = max, by = 1)
}

## ------------------------------------------------------------------------
pdunif <- function(q, min = 0, max = 1,
                   lower.tail = TRUE,
                   log.p = FALSE){
  q <- round(q, 7)
  z <- ifelse(q < min, 0, 
              ifelse(q >= max, 1, 
              (floor(q) - min + 1)/(max - min + 1)))
  if(!lower.tail) z <- 1 - z
  if(log.p) log(z) else z
}

## ------------------------------------------------------------------------
D <- dunifdist(1, 6)
p(D, 4)
plim(D, 4)

## ------------------------------------------------------------------------
atan.univdist <- function(x){
  trafo(x, type = "init", 
           trans = quote(atan(X)), 
           invtrans = quote(tan(X)),
           print = quote(atan(X)), 
           deriv = quote(1+tan(X)^2),
           operation = "atan")
}

## ----fig.height=1.8,fig.width=3.4,message=FALSE,warning=FALSE------------
ataNorm <- atan(normdist())
library(ggplot2)
autoplot(ataNorm)
ataNorm

## ------------------------------------------------------------------------
log(2+ataNorm)

## ------------------------------------------------------------------------
atan.trans_univdist <- function(x){
  if (last_history(x, "operation") == "tan") {
       return(trafo(x, type = "go_back"))
  } else {
       return(trafo(x, type = "new", 
                       trans = quote(atan(X)), 
                       invtrans = quote(tan(X)),
                       print = quote(atan(X)), 
                       deriv = quote(1+tan(X)^2), 
                       operation = "atan"))
  }
}

## ------------------------------------------------------------------------
`+.dunifdist` <- function(e1, e2){
  if (is.dist(e1)) {
        O <- e1
        x <- e2
    } else {
        O <- e2
        x <- e1
    }
   dunifdist(min = parameters(O)["min"] + x,
             max = parameters(O)["max"] + x)
}

## ------------------------------------------------------------------------
D2 <- atan(D+5)
D2

## ------------------------------------------------------------------------
p(D2, c(1.41, 1.43, 1.45, 1.47))

