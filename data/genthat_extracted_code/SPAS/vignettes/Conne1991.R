## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----libraries-----------------------------------------------------------
library(SPAS)

## ----loaddata------------------------------------------------------------
conne.data.csv <- textConnection("
9  ,    21  ,     0  ,    0  ,    0  ,    0  ,   171
0  ,   101  ,    22  ,    1  ,    0  ,    0  ,   763
0  ,     0  ,   128  ,   49  ,    0  ,    0  ,   934
0  ,     0  ,     0  ,   48  ,   12  ,    0  ,   434
0  ,     0  ,     0  ,    0  ,    7  ,    0  ,    49
0  ,     0  ,     0  ,    0  ,    0  ,    0  ,     4
351,  2736  ,  3847  , 1818  ,  543  ,   191 ,     0")
conne.data <- as.matrix(read.csv(conne.data.csv, header=FALSE))

## ----fit1,results="hide"-------------------------------------------------
mod1 <- SPAS::SPAS.fit.model(conne.data,
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

