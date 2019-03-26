library(marg)


### Name: anova.rsm
### Title: ANOVA Table for a RSM Object
### Aliases: anova.rsm
### Keywords: internal methods models regression

### ** Examples

## Sea Level Data
data(venice)
attach(venice)
Year <- 1:51/51
c11 <- cos(2*pi*1:51/11) ; s11 <- sin(2*pi*1:51/11)
c19 <- cos(2*pi*1:51/18.62) ; s19 <- sin(2*pi*1:51/18.62)
venice.p <- rsm(sea ~ Year + I(Year^2) + c11 + s11 + c19 + s19, 
                family = extreme)
anova(venice.p)
##
venice.l <- rsm(sea ~ Year + I(Year^2), family = extreme)
anova(venice.p, venice.l)
##
detach()

## House Price Data
data(houses)
houses.rsm <- rsm(price ~ ., family = student(5), data = houses)
anova(houses.rsm)



