library(protViz)


### Name: deisotoper
### Title: find isotop pattern in a given mass spectrum
### Aliases: deisotoper

### ** Examples

    # example1 - tandem ms
    x <- list(mZ = c(726.068, 726.337, 726.589, 726.842, 727.343, 727.846, 728.346, 
        728.846, 729.348, 730.248, 730.336, 730.581, 730.836),
        intensity = c(6.77850e+03, 2.81688e+04, 6.66884e+04, 1.22032e+07, 
            9.90405e+06, 4.61409e+06, 1.50973e+06, 3.33996e+05, 5.09421e+04, 
            1.15869e+03, 2.14788e+03, 5.37853e+03, 5.79094e+02))

    # the plain C interface function
    out1 <- .Call("deisotoper_main", x$mZ, x$intensity, Z=1:4, averagine, 
        massError=0.01, PACKAGE="protViz")

    out<-deisotoper(data=list(x), Z=2:4, isotopPatternDF=averagine)

    # example2 - a ms from heavy labeld peptide in water background    
    x <- list(mZ=c(642.572, 643.054, 643.569, 644.062, 644.557),
        intensity=c(17000, 25000, 12000, 9000,4000))

    diff(x$mZ)
    diff(x$mZ,lag=2)
    diff(x$mZ, difference=2)

    out2<-deisotoper(data=list(x), Z=1:2, isotopPatternDF=averagine, 
        massError=0.02, plot=TRUE)




