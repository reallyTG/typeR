library(hoa)


### Name: plot.marg
### Title: Generate Plots for an Approximate Marginal Inference Object
### Aliases: plot.marg
### Keywords: methods regression

### ** Examples

# Sea Level Data
data(venice)
attach(venice)
Year <- 1:51/51
c11 <- cos(2*pi*1:51/11) ; s11 <- sin(2*pi*1:51/11)
c19 <- cos(2*pi*1:51/18.62) ; s19 <- sin(2*pi*1:51/18.62)
#
# quadratic model fitted to the sea level, includes 18.62-year 
# astronomical tidal cycle and 11-year sunspot cycle
venice.rsm <- rsm(sea ~ Year + I(Year^2) + c11 + s11 + c19 + s19, 
                  family = extreme)
venice.marg <- cond(venice.rsm, I(Year^2))
plot(venice.marg, which = 4)
##
detach()



