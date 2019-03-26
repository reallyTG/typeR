## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----loading library, include=FALSE--------------------------------------
library(RQEntangle)
library(dplyr)
library(ggplot2)

## ----coupledfcn----------------------------------------------------------
coupled.harm.fcn<- function(x1, x2) sqrt(0.7)*dnorm(x1, mean=0, sd=0.5)*dnorm(x2, mean=0, sd=sqrt(0.15)) + sqrt(0.3)*dnorm(x1, mean=5, sd=0.5)*dnorm(x2, mean=6, sd=sqrt(0.1))

## ----run_decompose-------------------------------------------------------
modes<- continuous.schmidt.decompose(coupled.harm.fcn, -10, 10, -10, 10, nbx1 = 200, nbx2 = 200)

## ----eigenvals-----------------------------------------------------------
data.frame(n=1:10, eigenvalue=lapply(modes[1:10], function(mode) mode$eigenvalue) %>% unlist) %>% 
  ggplot(aes(x=n, y=eigenvalue)) + geom_point() + ggtitle('Schmidt weights')

## ----plotmodes1----------------------------------------------------------
xarray<- seq(-5, 5, 10/50)
data.frame(x=xarray, y1=modes[[1]]$sys1eigfcn(xarray), y2=modes[[1]]$sys2eigfcn(xarray)) %>%
  ggplot(aes(x=x)) + geom_line(aes(y=y1), col='red') + geom_line(aes(y=y2), col='blue') + xlab('x') + ylab('y') + 
  ggtitle('Schmidt mode 1')

## ----plotmodes2----------------------------------------------------------
xarray<- seq(-10, 10, 10/50)
data.frame(x=xarray, y1=modes[[2]]$sys1eigfcn(xarray), y2=modes[[2]]$sys2eigfcn(xarray)) %>%
  ggplot(aes(x=x)) + geom_line(aes(y=y1), col='red') + xlab('x') + ylab('y') + 
  ggtitle('Schmidt mode 2')

## ----plotmodes2a---------------------------------------------------------
xarray<- seq(-10, 10, 10/50)
data.frame(x=xarray, y1=modes[[2]]$sys1eigfcn(xarray), y2=modes[[2]]$sys2eigfcn(xarray)) %>%
  ggplot(aes(x=x)) + geom_line(aes(y=y2), col='red') + xlab('x') + ylab('y') + 
  ggtitle('Schmidt mode 2')

## ----printeigval---------------------------------------------------------
cat(modes[[1]]$eigenvalue, modes[[2]]$eigenvalue, '\n')

