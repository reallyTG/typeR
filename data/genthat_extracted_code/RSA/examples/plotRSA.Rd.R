library(RSA)


### Name: plotRSA
### Title: Plots a response surface of a polynomial equation of second
###   degree
### Aliases: plotRSA

### ** Examples

# Plot response surfaces from known parameters
# example of Edwards (2002), Figure 3
## Not run: 
##D # Default: 3d plot:
##D plotRSA(x=.314, y=-.118, x2=-.145, y2=-.102, xy=.299, b0=5.628)
##D # Contour plot:
##D plotRSA(x=.314, y=-.118, x2=-.145, y2=-.102, xy=.299, b0=5.628, type="c")
##D # Interactive plot (try the mouse!):
##D plotRSA(x=.314, y=-.118, x2=-.145, y2=-.102, xy=.299, b0=5.628, type="i")
##D 
##D # Plot response surface from an RSA object
##D set.seed(0xBEEF)
##D n <- 300
##D err <- 2
##D x <- rnorm(n, 0, 5)
##D y <- rnorm(n, 0, 5)
##D df <- data.frame(x, y)
##D df <- within(df, {
##D 	diff <- x-y
##D 	absdiff <- abs(x-y)
##D 	SD <- (x-y)^2
##D 	z.diff <- diff + rnorm(n, 0, err)
##D 	z.abs <- absdiff + rnorm(n, 0, err)
##D 	z.sq <- SD + rnorm(n, 0, err)
##D 	z.add <- diff + 0.4*x + rnorm(n, 0, err)
##D 	z.complex <- 0.4*x + - 0.2*x*y + + 0.1*x^2 - 0.03*y^2 + rnorm(n, 0, err)
##D })
##D 
##D r1 <- RSA(z.sq~x*y, df, models=c("SQD", "full", "IA"))
##D plot(r1)	# default: model = "full"
##D plot(r1, model="SQD", points=list(show=TRUE, value="predicted"))
## End(Not run)



