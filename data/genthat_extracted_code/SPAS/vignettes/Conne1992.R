## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----libraries-----------------------------------------------------------
library(SPAS)

## ----loaddata------------------------------------------------------------
conne.data.csv <- textConnection("
 149,  126,    0,    0,    0,    0,      1561
   0,  308,   65,    0,    0,    0,      1235
   0,    0,  161,   77,    0,    0,       884
   0,    0,    0,   67,    7,    0,       215
   0,    0,    0,    0,   17,    3,        71
   0,    0,    0,    0,    0,   13,        16
1895, 8503, 2184,  525,  155,  118,         0")
conne.data <- as.matrix(read.csv(conne.data.csv, header=FALSE))

## ----fit1,results="hide"-------------------------------------------------
mod1 <- SPAS.fit.model(conne.data,
                       model.id="No restrictions",
                       row.pool.in=1:6, col.pool.in=1:6,
                       optMethod.control=list(ftol=.0001))

## ----mod1p---------------------------------------------------------------
SPAS.print.model(mod1)

## ----str1----------------------------------------------------------------
names(mod1)
names(mod1$real)
names(mod1$real$est.indiv)

## ----fit2,results="hide"-------------------------------------------------
mod2 <- SPAS.fit.model(conne.data, model.id="Pooling some rows",
                       row.pool.in=c("12","12","3","4","56","56"),
                       col.pool.in=c(1,2,3,4,56,56))

## ----mod2p---------------------------------------------------------------
SPAS.print.model(mod2)

## ----mod3,results='hide'-------------------------------------------------
mod3 <- SPAS.fit.model(conne.data, model.id="A single row",
                       row.pool.in=rep(1, nrow(conne.data)-1),
                       col.pool.in=c(1,2,3,4,56,56))

## ----mod3p---------------------------------------------------------------
SPAS.print.model(mod3)

## ----mod4,results='hide'-------------------------------------------------
mod4 <- SPAS.fit.model(conne.data, model.id="Pooled Peteren",
                       row.pool.in=rep(1, nrow(conne.data)-1),
                       col.pool.in=rep(1, ncol(conne.data)-1))

## ----mod4p---------------------------------------------------------------
SPAS.print.model(mod4)

