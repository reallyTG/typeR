library(NISTnls)


### Name: ENSO
### Title: Atmospheric pressure differences
### Aliases: ENSO
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = ENSO)
plot(y ~ x, data = ENSO, type = "l")  # to see the pattern more clearly
Try(fm1 <- nls(y ~ b1 + b2*cos( 2*pi*x/12 ) + b3*sin( 2*pi*x/12 ) 
                   + b5*cos( 2*pi*x/b4 ) + b6*sin( 2*pi*x/b4 )
                   + b8*cos( 2*pi*x/b7 ) + b9*sin( 2*pi*x/b7 ),
            data = ENSO, trace = TRUE,
            start = c(b1 = 11.0, b2 = 3.0, b3 = 0.5, b4 = 40.0, b5 = -0.7,
                      b6 = -1.3, b7 = 25.0, b8 = -0.3, b9 = 1.4)))
Try(fm1a <- nls(y ~ b1 + b2*cos( 2*pi*x/12 ) + b3*sin( 2*pi*x/12 ) 
                    + b5*cos( 2*pi*x/b4 ) + b6*sin( 2*pi*x/b4 )
                    + b8*cos( 2*pi*x/b7 ) + b9*sin( 2*pi*x/b7 ),
             data = ENSO, trace = TRUE, alg = "port",
             start = c(b1 = 11.0, b2 = 3.0, b3 = 0.5, b4 = 40.0, b5 = -0.7,
                       b6 = -1.3, b7 = 25.0, b8 = -0.3, b9 = 1.4)))
Try(fm2 <- nls(y ~ b1 + b2*cos( 2*pi*x/12 ) + b3*sin( 2*pi*x/12 ) 
                   + b5*cos( 2*pi*x/b4 ) + b6*sin( 2*pi*x/b4 )
                   + b8*cos( 2*pi*x/b7 ) + b9*sin( 2*pi*x/b7 ),
            data = ENSO, trace = TRUE,
            start = c(b1 = 10.0, b2 =  3.0, b3 =  0.5, b4 = 44.0, b5 = -1.5,
                     b6 =  0.5, b7 = 26.0, b8 = -0.1, b9 =  1.5)))
Try(fm2a <- nls(y ~ b1 + b2*cos( 2*pi*x/12 ) + b3*sin( 2*pi*x/12 ) 
                    + b5*cos( 2*pi*x/b4 ) + b6*sin( 2*pi*x/b4 )
                    + b8*cos( 2*pi*x/b7 ) + b9*sin( 2*pi*x/b7 ),
             data = ENSO, trace = TRUE, alg = "port",
             start = c(b1 = 10.0, b2 =  3.0, b3 =  0.5, b4 = 44.0, b5 = -1.5,
                     b6 =  0.5, b7 = 26.0, b8 = -0.1, b9 =  1.5)))
Try(fm3 <- nls(y ~ cbind(1, cos( 2*pi*x/12 ), sin( 2*pi*x/12 ), cos( 2*pi*x/b4 ),
                      sin( 2*pi*x/b4 ), cos( 2*pi*x/b7 ), sin( 2*pi*x/b7 )),
            data = ENSO, trace = TRUE,
            start = c(b4 = 40.0, b7 = 25.0), algorithm = "plinear"))
Try(fm4 <- nls(y ~ cbind(1, cos( 2*pi*x/12 ), sin( 2*pi*x/12 ), cos( 2*pi*x/b4 ),
                    sin( 2*pi*x/b4 ), cos( 2*pi*x/b7 ), sin( 2*pi*x/b7 )),
            data = ENSO, trace = TRUE,
            start = c(b4 = 44.0, b7 = 26.0), algorithm = "plinear"))



