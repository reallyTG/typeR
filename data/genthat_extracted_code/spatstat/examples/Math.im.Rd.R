library(spatstat)


### Name: Math.im
### Title: S3 Group Generic methods for images
### Aliases: Math.im Ops.im Complex.im Summary.im
### Keywords: spatial methods

### ** Examples

  ## Convert gradient values to angle of inclination:
  V <- atan(bei.extra$grad) * 180/pi
  ## Make logical image which is TRUE when heat equals 'Moderate': 
  A <- (gorillas.extra$heat == "Moderate")
  ## Summary:
  any(A)
  ## Complex:
  Z <- exp(1 + V * 1i)
  Z
  Re(Z)



