library(hoa)


### Name: cond.rsm
### Title: Approximate Conditional Inference in Regression-Scale Models
### Aliases: cond.rsm
### Keywords: models regression methods

### ** Examples

## Sea Level Data
data(venice)
attach(venice)
Year <- 1:51/51
c11 <- cos(2*pi*1:51/11) ; s11 <- sin(2*pi*1:51/11)
c19 <- cos(2*pi*1:51/18.62) ; s19 <- sin(2*pi*1:51/18.62)
##
## quadratic model fitted to the sea level, includes 18.62-year 
## astronomical tidal cycle and 11-year sunspot cycle
venice.rsm <- rsm(sea ~ Year + I(Year^2) + c11 + s11 + c19 + s19, 
                  family = extreme)
names(coef(venice.rsm))
## "(Intercept)"  "Year"  "I(Year^2)"  "c11"  "s11"  "c19"  "s19"      
##
## variable of interest: quadratic term
venice.marg <- cond(venice.rsm, I(Year^2))
##
detach()

## House Price Data
data(houses)
houses.rsm <- rsm(price ~ ., family = student(5), data = houses)
##
## parameter of interest: scale parameter
houses.marg <- cond(houses.rsm, scale)



