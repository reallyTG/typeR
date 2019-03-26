library(VGAMextra)


### Name: gen.betaIImr
### Title: Generalized Beta Distribution of the Second Kind family function
### Aliases: gen.betaIImr
### Keywords: Singh-Maddala Dagum Inverse Weibull

### ** Examples


#----------------------------------------------------------------------- #
# An example.- In this data set parameters 'shape1.a' and 'shape3.q' are 
# generated in terms of x2.

set.seed(1003)
nn <- 200
gdata1  <- data.frame(x2 = runif(nn))
gdata   <- transform(gdata1,
           y1 = rgen.betaII(nn, scale = exp(1.1), shape1.a = exp(1.2 + x2), 
                            shape2.p = exp(0.7) , shape3.q = exp(2.1 - x2)),
           y2 = rgen.betaII(nn, scale = exp(2.0), shape1.a = exp(1.8 + x2),
                            shape2.p = exp(2.3) , shape3.q = exp(1.9 - x2)), 
           y3 = rgen.betaII(nn, scale = exp(1.5), shape1.a = exp(1.8),
                            shape2.p = exp(2.3) , shape3.q = exp(1.3)))
                            
#------------------------------------------------------------------------#
# A single intercept-only model. No covariates.
# Note the use of (optional) initial values.
fit  <- vglm(y2 ~ 1,   #y3 ~ 1
             gen.betaIImr(lss = TRUE,
                          # OPTIONAL INITIAL VALUES
                           #iscale    = exp(1.5), 
                           #ishape1.a = exp(1.8),
                           #ishape2.p = exp(2.3),
                           #ishape3.q = exp(1.3),
                          
                          imethod = 1),  
             data = gdata, trace = TRUE, crit = "loglik")
             
Coef(fit)
coef(fit, matrix = TRUE)
summary(fit)

#------------------------------------------------------------------------#
# An intercept-only model. Two responses.
fit1 <- vglm(cbind(y2, y2) ~ 1,   # cbind(y1, y2)
             gen.betaIImr(lss = TRUE),  
             data = gdata, trace = TRUE, crit = "loglik")
             
Coef(fit1)
coef(fit1, matrix = TRUE)
summary(fit1)
vcov(fit1, untransform = TRUE)

#------------------------------------------------------------------------#
# An example incorporating one covariate. Constraints are set accordingly.
# x2 affects shape1.a and shape3.q.
# Note that the first option uses 'constraints', whilst in the second
# choice we use the argument 'zero' to 'set' the same constraints.

### Option 1.
c1 <- rbind(0, 1, 0, 0)
c2 <- rbind(0, 0, 0, 1)
mycons <- matrix( c(c1, c2), nc = 2, byrow = FALSE)

fit2 <- vglm(y1 ~ x2, gen.betaIImr(lss = TRUE, zero = NULL),
             data = gdata, trace = TRUE, crit = "loglik",
             constraints = list(x2 = mycons ))

coef(fit2, matrix = TRUE)
summary(fit2)
vcov(fit2)
constraints(fit2)


### Option 2.
fit3 <- vglm(y1 ~ x2, 
             gen.betaIImr(lss = TRUE, 
                          zero = c("scale", "shape2.p")),
             data = gdata, trace = TRUE, crit = "loglik")

coef(fit3, matrix = TRUE)
summary(fit3)
vcov(fit3)
constraints(fit3)

  



