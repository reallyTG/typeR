library(hoa)


### Name: rsm
### Title: Fit a Regression-Scale Model
### Aliases: rsm
### Keywords: models regression

### ** Examples

## House Price Data
data(houses)
houses.rsm <- rsm(price ~ ., family = student(5), data = houses)
## model fit including all covariates
houses.rsm <- rsm(price ~ ., family = student(5), data = houses, 
                  method = "rsm.fit", control = glm.control(trace = TRUE))
## prints information about the iterative procedure at each iteration
update(houses.rsm, ~ . - bdroom + offset(7 * bdroom))
## "bdroom" is included as offset variable with fixed (= 7) coefficient

## Sea Level Data
data(venice)
attach(venice)
Year <- 1:51/51
venice.2.rsm <- rsm(sea ~ Year + I(Year^2), family = extreme)
## quadratic model fitted to sea level data
venice.1.rsm <- update(venice.2.rsm, ~. - I(Year^2))
## linear model fit
##
c11 <- cos(2*pi*1:51/11) ; s11 <- sin(2*pi*1:51/11)
c19 <- cos(2*pi*1:51/18.62) ; s19 <- sin(2*pi*1:51/18.62)
venice.rsm <- rsm(sea ~ Year + I(Year^2) + c11 + s11 + c19 + s19, 
                  family = extreme)
## includes 18.62-year astronomical tidal cycle and 11-year sunspot cycle
venice.11.rsm <- rsm(sea ~ Year + I(Year^2) + c11 + s11, family = extreme)
venice.19.rsm <- rsm(sea ~ Year + I(Year^2) + c19 + s19, family = extreme)
## includes either astronomical cycle
##
## comparison of linear, quadratic and periodic (11-year, 19-year) models 
plot(year, sea, ylab = "sea level") 
lines(year, fitted(venice.1.rsm))
lines(year, fitted(venice.2.rsm), col="red")
lines(year, fitted(venice.11.rsm), col="blue")
lines(year, fitted(venice.19.rsm), col="green")
##
detach()

## Darwin's Data on Growth Rates of Plants
data(darwin)
darwin.rsm <- rsm(cross - self ~ pot - 1, family  =  student(3), 
                  data = darwin)
## Maximum likelihood estimates
darwin.rsm <- rsm(cross - self ~ pot - 1, family = Huber, data = darwin)
## M-estimates



