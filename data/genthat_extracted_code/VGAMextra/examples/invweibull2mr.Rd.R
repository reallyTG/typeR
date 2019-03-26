library(VGAMextra)


### Name: invweibull2mr
### Title: 2- parameter Inverse Weibull Distribution
### Aliases: invweibull2mr
### Keywords: Inverse Weibull distribution Fisher scoring VGAM

### ** Examples

#-----------------------------------------------------------------------#
# Here, covariate 'x2' affects the scale parameter.
# See how data is generated.

set.seed(102)
wdata <- data.frame(x2 = runif(nn <- 1000))  # Complete data
wdata <- transform(wdata,
            y1 = rinvweibull(nn, scale = exp(2.5 - (0.5) * x2), 
                             shape = exp(1.5) ),
                             
            y2 = rinvweibull(nn, scale = exp(1.5 + x2), 
                             shape = exp(1.25) ))
            
#------------------------------------------------------------------------#
# Fitting the Inverse Weibull distribution accordingly.
# Note that multiple responses are handled. 

fit1 <- vglm(cbind(y1, y2) ~ x2, 
             invweibull2mr(zero = "shape",
                           # OPTIONAL INITIAL VALUE. Be carefull here when
                           # entered initial value. Sensitive distribution
                             ishape = exp(1.2),
                          lss = TRUE),                           
             data = wdata, trace = TRUE, crit = "log")

coef(fit1, matrix = TRUE)
vcov(fit1)
summary(fit1)

###   A second option (producing same results!!) might be to use the 
###   constraints argument in the 'vglm()' call. Note that 'x2' affects
###   the scale parameter only.

fit2 <- vglm(y1 ~ x2, 
             invweibull2mr(zero = NULL), 
             data = wdata, trace = TRUE,
             constraints = list(x2 = rbind(1, 0)))
            
coef(fit2, matrix = TRUE)
vcov(fit2)
summary(fit2)
constraints(fit2)






