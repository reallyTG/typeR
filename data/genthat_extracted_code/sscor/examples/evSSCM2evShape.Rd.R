library(sscor)


### Name: evSSCM2evShape
### Title: Calculation of the eigenvalues of the shape matrix
### Aliases: evSSCM2evShape

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



