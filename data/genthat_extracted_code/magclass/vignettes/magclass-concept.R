## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ---- echo = TRUE, message = FALSE---------------------------------------
# load magclass package
library(magclass)

## ---- echo = TRUE--------------------------------------------------------
a <- matrix(1:9, 3, 3, dimnames=list(c("AFR","CPA","EUR"),
                                     paste0("y",2000:2002)))
a

## ---- echo = TRUE--------------------------------------------------------
b <- array(1:18, dim=c(3,3,2), 
           dimnames=list(paste0("y",2000:2002), 
                         c("AFR","CPA","EUR"), 
                         c("IndexA","IndexB")))
b

## ---- echo = TRUE--------------------------------------------------------
library(magclass)

as.data.frame(b)

as.data.frame(as.magpie(b))

## ---- echo = TRUE--------------------------------------------------------
as.magpie(b)

## ---- echo = TRUE--------------------------------------------------------
ar <- array(1:6, c(3,2), list(c("bla","blub","ble"),
                              c("up","down")))
a <- as.magpie(ar)
head(a)

getNames(a)

getNames(a[,,"up"])

getNames(a[,,"up",drop=TRUE])

fulldim(a)


## ---- echo = TRUE--------------------------------------------------------
c <- as.magpie(b)
# change order of spatial components
d <- c[3:1,,]

# correct summation based on dimension names:
c+d

#wrong summation (dimension names ignored):
as.array(c)+as.array(d)


