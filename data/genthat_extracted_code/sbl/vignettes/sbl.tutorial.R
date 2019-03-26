## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----installation, eval=FALSE, message=FALSE, warning=FALSE--------------
#  install.packages('sbl_0.1.0.tar.gz', repos=NULL, type='source')

## ----load data, message=FALSE, warning=FALSE-----------------------------
library('sbl')

# load example data
data(phe)
data(intercept)
data(gen)

## ----minimal invocation, message=FALSE, warning=FALSE--------------------
# A minimal invocation of "sblgwas()" function looks like: 
fit1<-sblgwas(x = intercept, y = phe, z = gen)

# Restuls of markers surrounding the second simulated QTL with non-zero effect in the example data
fit1$blup[c(17:21),]

## ----hyper parameter, message=FALSE, warning=FALSE-----------------------
# Setting t = 0 leads to the most sparse model  
fit2<-sblgwas(x = intercept, y = phe, z = gen, t = 0)
fit2$parm

# Setting t = -2 leads to the least sparse model  
fit3<-sblgwas(x = intercept, y = phe, z = gen, t = -2)
fit3$parm

## ----iteration, message=FALSE, warning=FALSE-----------------------------
# Set max.iter and min.err to control the convergence of the program 
fit4<-sblgwas(x = intercept, y = phe, z = gen, t = -1, max.iter = 300, min.err = 1e-8)
fit4$parm

