## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----loading library, include=FALSE--------------------------------------
library(RQEntangle)
library(dplyr)
library(ggplot2)

## ----coupledfcn----------------------------------------------------------
coupled.harm.fcn<- function(x1,x2) exp(-((0.5*(x1+x2))**2))*exp(-(x1-x2)**2)*sqrt(2./pi)

## ----run_decompose-------------------------------------------------------
modes<- continuous.schmidt.decompose(coupled.harm.fcn, -10, 10, -10, 10)

## ----eigenvals-----------------------------------------------------------
data.frame(n=1:10, eigenvalue=lapply(modes[1:10], function(mode) mode$eigenvalue) %>% unlist) %>% 
  ggplot(aes(x=n, y=eigenvalue)) + geom_point() + ggtitle('Schmidt weights')

## ----plotmodes1----------------------------------------------------------
xarray<- seq(-5, 5, 10/50)
data.frame(x=xarray, y1=modes[[1]]$sys1eigfcn(xarray), y2=modes[[1]]$sys2eigfcn(xarray)) %>%
  ggplot(aes(x=x)) + geom_line(aes(y=y1), col='red') + geom_line(aes(y=y2), col='blue') + xlab('x') + ylab('y') + 
  ggtitle('Schmidt mode 1')

## ----plotmodes2----------------------------------------------------------
xarray<- seq(-5, 5, 10/50)
data.frame(x=xarray, y1=modes[[2]]$sys1eigfcn(xarray), y2=modes[[2]]$sys2eigfcn(xarray)) %>%
  ggplot(aes(x=x)) + geom_line(aes(y=y1), col='red') + geom_line(aes(y=y2), col='blue') + xlab('x') + ylab('y') + 
  ggtitle('Schmidt mode 2')

