library(decisionSupport)


### Name: discount
### Title: Discount time series for Net Present Value (NPV) calculation
### Aliases: discount
### Keywords: ~kwd1 ~kwd2

### ** Examples


x<-c(3,6,2,5,4,3,9,0,110)
discount_rate<-5

discount(x,discount_rate)
discount(x,discount_rate,calculate_NPV=TRUE)





