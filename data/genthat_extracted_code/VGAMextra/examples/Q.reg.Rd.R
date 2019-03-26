library(VGAMextra)


### Name: Q.reg
### Title: Conditional quantile regression with 'VGAM'
### Aliases: Q.reg

### ** Examples

   
  ###  Quantile regression with data distributed as Maxwell(s)  ###
   set.seed(12073)
   x2 <- seq(0, 100,length.out = 100)       # independent variable
   b0 <- 0.5                                # true intercept
   b1 <- 0.25                               # true slope
   b2 <- 0.02                               # true second order coef.
   alpha <- b0 + b1 * x2 + b2 * x2^2        # Quadratically modelling the parameters
   nn <- 100                                # Sample size
  
   # The data as a data frame. #
   mdata <- data.frame(y = rmaxwell(n = nn, rate = alpha), x2 = x2, x3 = x2^2)
   
   # Quantile regression using our link function maxwellQlink(). #
   # Quantiles 25%, 50%, 75% are of interest #
   my.p <- c(0.25, 0.50, 0.75)
   
   fit <- vglm(Q.reg(y, pvector = my.p) ~ x2 + x3, 
   
  # OPTIONALLY Q.reg(y, length = length(my.p)) ~ x2 + x3
   
              maxwell(link = maxwellQlink(p = my.p)), 
              data = mdata,  trace = TRUE, crit = "coef")

   coef(fit, matrix = TRUE) 
   summary(fit)
   head(predict(fit))
   constraints(fit)



