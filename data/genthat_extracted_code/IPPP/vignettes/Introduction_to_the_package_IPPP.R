## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
xrate=c(1,4,5,7,8)
yrate=c(2,1,3,4,0)
plot(xrate,yrate,type='l',ylab='rate',xlab='x',main='Rate Function' )

## ------------------------------------------------------------------------
#rate function to approximate
ratefunction=function (x){
  return(abs(sin(x)))
} 
#where to approximate the rate function
xrate=seq(0,2*pi,length.out = 500)
#approximate
yrate=ratefunction(xrate)
plot(xrate,yrate,type='l',ylab='rate',xlab='x',main='Rate Function' )

