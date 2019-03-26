## ----echo=FALSE, message=FALSE, warning=FALSE----------------------------
rm(list=ls())
library(highlight)
library(knitr)
##homedir <- '/home/rmcd/tex/d67/Rtutorial/'
options(digits=4)
figsize <- 4.5
opts_chunk$set(size='footnotesize', prompt=FALSE, comment=NA,
               fig.align='center', fig.width = figsize,
               fig.height=figsize, out.width='3.75in')

#              , fig.width=4.5*3.75/3.25, fig.height=4.5,
#              , out.width='3.75in', out.height='3.25in'
#               )
opts_knit$set(highlight = TRUE,
              eval.after='fig.cap',
              prompt=TRUE,
              renderer=renderer_latex(document=FALSE),
              size='footnotesize')
curr <- function(amt)  formatC(amt, format='f', digits=2)

## ----echo=FALSE----------------------------------------------------------
library(derivmkts)
library(mnormt)
library(markdown)

opts_chunk$set(collapse=TRUE)

## ----eval=FALSE----------------------------------------------------------
#  library(derivmkts)
#  library(microbenchmark)
#  S <- seq(0.5, 250, by=0.5)
#  bsv <- Vectorize(bscall)
#  microbenchmark(out1 <- bsv(S, 40, .3, .08, .25, 0))
#  microbenchmark(out2 <- bscall(S, 40, .3, .08, .25, 0))
#  all.equal(out1, out2)

## ------------------------------------------------------------------------
f = function(a, b, k) a*b + k
f(3, 5, 1) 
f(1:5, 5, 1) 
f(1:6, 1:2, 1) 

## ------------------------------------------------------------------------
cond1 <- function(a, b, k) {
    if (a > b) {
        a*b + k
    } else {
        k
    }
}
cond1(5, 3, 1)
cond1(5, 7, 1)
cond1(3:7, 5, 1)


## ------------------------------------------------------------------------
cond2 <- function(a, b, k) {
    ifelse(a > b, 
           a*b + k,  
           k
           )
}
cond2(5, 3, 1)
cond2(5, 7, 1)
cond2(3:7, 5, 1)


## ------------------------------------------------------------------------
cond2(5, 7, 1:3)

## ------------------------------------------------------------------------
cond2b <- function(a, b, k) {
    agtb <- (a > b)
    agtb*(a*b + k) + (1-agtb)*k
}

cond2b(5, 3, 1)
cond2b(5, 7, 1)
cond2b(3:7, 5, 1)
cond2b(5, 7, 1:3)


## ------------------------------------------------------------------------
cond2c <- function(a, b, k) {
    tmp <- data.frame(a, b, k)
    for (i in names(tmp)) assign(i, tmp[[i]])
    ifelse(a > b, 
           a*b + k,  
           k
           )
}

cond2c(5, 3, 1)
cond2c(5, 7, 1)
cond2c(3:7, 5, 1)
cond2c(5, 7, 1:3)


## ------------------------------------------------------------------------
vectorizeinputs <- function(e) {
    ## e is the result of match.call() in the calling function
    e[[1]] <- NULL
    e <- as.data.frame(as.list(e))
    for (i in names(e)) assign(i, eval(e[[i]]),
                               envir=parent.frame())
}

## ------------------------------------------------------------------------
cond3 <- function(a, b, k) { 
    vectorizeinputs(match.call())
    ifelse(a > b, a*b + k, k)
}
cond3(5, 7, 1:3)
cond3(3:7, 5, 1)
cond3(3:7, 5, 1:5)
cond3(k=1:5, 3:7, 5)


## ------------------------------------------------------------------------
cond4 <- function(a, b, k, multby2=TRUE) {
    vectorizeinputs(match.call())
    ifelse(multby2, 
           2*(a*b + k), 
           a*b + k
           )
}
cond4(5, 7, 1:3)
cond4(3:7, 5, 1)
cond4(3:7, 5, 1:5)
cond4(k=1:5, 3:7, 5)


## ------------------------------------------------------------------------
vectorizeinputs2 <- function(e) {
    funcname <- e[[1]]
    fvals <- formals(eval(funcname))
    fnames <- names(fvals)
    e[[1]] <- NULL
    e <- as.data.frame(as.list(e))
    implicit <- setdiff(fnames, names(e))
    if (length(implicit) > 0) e <- data.frame(e, fvals[implicit])
    for (i in names(e)) assign(i, eval(e[[i]]),
                               envir=parent.frame())
}

cond5 <- function(a, b, k, multby2=TRUE, altmult=1) {
    vectorizeinputs2(match.call())
    ifelse(multby2, 
           2*(a*b + k), 
           altmult*(a*b + k)
           )
}
cond5(5, 7, 1:3)
cond5(3:7, 5, 1)
cond5(3:7, 5, 1:5)
cond5(k=1:5, 3:7, 5)
cond5(k=1:5, 3:7, 5, multby2=FALSE)
cond5(k=1:5, 3:7, 5, multby2=FALSE, altmult=5)


