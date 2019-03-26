library(Epi)


### Name: plotEst
### Title: Plot estimates with confidence limits (forest plot)
### Aliases: plotEst pointsEst linesEst
### Keywords: hplot models

### ** Examples

# Bogus data and a linear model
f <- factor( sample( letters[1:5], 100, replace=TRUE ) )
x <- rnorm( 100 )
y <- 5 + 2 * as.integer( f ) + 0.8 * x + rnorm(100) * 2
m1 <- lm( y ~ f )

# Produce some confidence intervals for contrast to first level
( cf <- ci.lin( m1, subset=-1 )[,-(2:4)] )

# Plots with increasing amounts of bells and whistles
par( mfcol=c(3,2), mar=c(3,3,2,1) )
plotEst( cf )
plotEst( cf, grid=TRUE, cex=2, lwd=3 )
plotEst( cf, grid=TRUE, cex=2, col.points="red", col.lines="green" )
plotEst( cf, grid=TRUE, cex=2, col.points="red", col.lines="green",
             xlog=TRUE, xtic=c(1:8), xlim=c(0.8,6) )
rownames( cf )[1] <- "Contrast to fa:\n fb"
plotEst( cf, grid=TRUE, cex=2, col.points=rainbow(4),
                                col.lines=rainbow(4), vref=1 )
#
etxt <- expression("Plain text, qouted",
                   "combined with maths:"*sqrt(a)*phi[c],
                   f^d*"  Hb"*A[1][c],
                   eff^e*"  kg/"*m^2)
plotEst( cf, txt=etxt, grid=TRUE, cex=2, col.points=rainbow(4),
                                         col.lines =rainbow(4), vref=1 )
  


