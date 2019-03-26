## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----libraries-----------------------------------------------------------
library(SPAS)

## ----loaddata------------------------------------------------------------
harrison.2011.chinook.F.csv <- textConnection("
  4   ,      2   ,      1   ,     1   ,     0   ,     0   ,   130
 12   ,      7   ,     14   ,     1   ,     3   ,     0   ,   330
  7   ,     11   ,     41   ,     9   ,     1   ,     1   ,   790
  1   ,     13   ,     40   ,    12   ,     9   ,     1   ,   667
  0   ,      1   ,      8   ,     8   ,     3   ,     0   ,   309
  0   ,      0   ,      0   ,     0   ,     0   ,     1   ,    65
744   ,   1187   ,   2136   ,   951   ,   608   ,   127   ,     0")

har.data <- as.matrix(read.csv(harrison.2011.chinook.F.csv, header=FALSE))
har.data

## ----fit1,results="hide"-------------------------------------------------
mod1 <- SPAS.fit.model(har.data,
                       model.id="No restrictions",
                       row.pool.in=1:6, col.pool.in=1:6,
                       optMethod.control=list(ftol=.00001))

## ----mod1p---------------------------------------------------------------
SPAS.print.model(mod1)

## ----str1----------------------------------------------------------------
names(mod1)
names(mod1$real)
names(mod1$real$est.indiv)

## ----fit2,results="hide"-------------------------------------------------
mod2 <- SPAS.fit.model(har.data, model.id="Pooling some rows",
                       row.pool.in=c("12","12","3","4","56","56"),
                       col.pool.in=c(1,2,3,4,56,56))

## ----mod2p---------------------------------------------------------------
SPAS.print.model(mod2)

## ----mod3,results='hide'-------------------------------------------------
mod3 <- SPAS.fit.model(har.data, model.id="A single row",
                       row.pool.in=rep(1, nrow(har.data)-1),
                       col.pool.in=c(1,2,3,4,56,56))

## ----mod3p---------------------------------------------------------------
SPAS.print.model(mod3)

## ----mod4,results='hide'-------------------------------------------------
mod4 <- SPAS.fit.model(har.data, model.id="Pooled Peteren",
                       row.pool.in=rep(1, nrow(har.data)-1),
                       col.pool.in=rep(1, ncol(har.data)-1))

## ----mod4p---------------------------------------------------------------
SPAS.print.model(mod4)

