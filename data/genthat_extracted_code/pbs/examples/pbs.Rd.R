library(pbs)


### Name: pbs
### Title: Periodic B-Spline Basis for Polynomial Splines
### Aliases: pbs pbs.pbs

### ** Examples

     require(stats); require(graphics); require(splines)
     x = seq(1,628)/100
     z = rep(seq(1, 314)/100, 2)
     
     
     pbs(x, df = 5, Boundary.knots = c(0, 2*pi))
     pbs(x, knots=c(pi/2, pi, pi*3/2), Boundary.knots = c(0, 2*pi))
     
     #### example of one periodic functions
     y= sin(x) + cos(2*x) + 
        rnorm(628, 0, 0.1) ## x has a period of 2*pi

     ## df method, need to use large enough df to get a better fit.  
     ## May use max loglik to choose optimal df
     summary( fm1 <- lm(y ~ pbs(x, df = 10, Boundary.knots = c(0, 2*pi))) )
     plot(x, y, xlab = "x", ylab = "sin(x)", pch="x", cex=.5)
     
     lines(x, predict(fm1, data.frame(x=x, z=z)), col='blue')
     lines(x, sin(x) + cos(2*x), col='red') 
     
     ## knots methods, usually selected at turning points
     summary( fm2 <- lm(y ~ pbs(x, knots=c(pi/2, pi, pi*3/2), 
              Boundary.knots = c(0, 2*pi)))
     )
     plot(x, y, xlab = "x", ylab = "sin(x)", pch="x", cex=.5)
     
     lines(x, predict(fm2, data.frame(x=x, z=z)), col='blue')
     lines(x, sin(x) + cos(2*x), col='red') 

     #### example of two periodic functions
     x0 = seq(1,628, by=4)/100
     z0 = seq(1, 314, by=3)/100
     x = rep(x0, each=length(z0))
     z = rep(z0, length(x0))
     y = sin(x) + cos(2*z) + 
        rnorm(length(x), 0, 0.1) ## x has a period of 2*pi and z of pi

     summary( fm3 <- lm(y ~ pbs(x, df = 5, Boundary.knots = c(0, 2*pi))+ 
                            pbs(z, df = 5, Boundary.knots = c(0, pi))) 
     )

     plot(sin(x) + cos(2*3), predict(fm3, data.frame(x=x, z=3)))
     summary(sin(x) + cos(2*3)- predict(fm3, data.frame(x=x, z=3)))
     ## End(Not run)



