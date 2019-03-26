library(spatstat)


### Name: fitted.ppm
### Title: Fitted Conditional Intensity for Point Process Model
### Aliases: fitted.ppm
### Keywords: spatial methods models

### ** Examples

    str <- ppm(cells ~x, Strauss(r=0.1))
    lambda <- fitted(str)

    # extract quadrature points in corresponding order
    quadpoints <- union.quad(quad.ppm(str))

    # plot conditional intensity values
    # as circles centred on the quadrature points 
    quadmarked <- setmarks(quadpoints, lambda)
    plot(quadmarked)

    if(!interactive()) str <- ppm(cells ~ x)

    lambdaX <- fitted(str, leaveoneout=TRUE)



