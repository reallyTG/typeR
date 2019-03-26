library(sscor)


### Name: evShape2evSSCM
### Title: Calculation of the eigenvalues of the Spatial Sign Covariance
###   Matrix
### Aliases: evShape2evSSCM

### ** Examples


# defining eigenvalues of the shape matrix
evShape <- seq(from=0,to=1,by=0.1)

# standardized to have sum 1
evShape <- evShape/sum(evShape)

# calculating the related eigenvalues of the SSCM
evSSCM <- evShape2evSSCM(evShape)

plot(evShape,evSSCM)

# recalculate the eigenvalues of the shape matrix
evShape2 <- evSSCM2evShape(evSSCM)

# error is negligible
sum(abs(evShape-evShape2))



