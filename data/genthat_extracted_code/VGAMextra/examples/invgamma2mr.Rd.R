library(VGAMextra)


### Name: invgamma2mr
### Title: 2 - parameter Inverse Gamma Distribution
### Aliases: invgamma2mr
### Keywords: VGAM Inverse Gamma distribution Fisher scoring

### ** Examples

#------------------------------------------------------------------------#
# Essentially fitting a 2-parameter inverse gamma distribution
# with 2 responses.

set.seed(101)
y1 = rinvgamma(n = 500, scale = exp(2.0), shape = exp(2.0))
y2 = rinvgamma(n = 500, scale = exp(2.5), shape = exp(2.5))
gdata <- data.frame(y1, y2)

fit1 <- vglm(cbind(y1, y2) ~ 1, 
            family = invgamma2mr(zero = NULL, 
            
                                 # OPTIONAL INITIAL VALUE
                                 # ishape = exp(2),
                                 
                                 imethod = 1),
            data = gdata, trace = TRUE)

Coef(fit1)
c(Coef(fit1), log(mean(gdata$y1)), log(mean(gdata$y2)))
summary(fit1)
vcov(fit1, untransform = TRUE)

#------------------------------------------------------------------------#
# An example including one covariate.
# Note that the x2 affects the shape parameter, which implies that both,
# 'mu' and 'shape' are affected.
# Consequently, zero must be set as NULL !

x2    <- runif(1000)
gdata <- data.frame(y3 = rinvgamma(n = 1000, 
                                   scale = exp(2.0), 
                                   shape = exp(2.0 + x2)))

fit2 <- vglm(y3 ~ x2, 
            family = invgamma2mr(lshape = "loge", zero = NULL), 
            data = gdata, trace = TRUE)

coef(fit2, matrix = TRUE)
summary(fit2)
vcov(fit2)




