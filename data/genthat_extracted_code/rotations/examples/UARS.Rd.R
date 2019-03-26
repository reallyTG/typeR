library(rotations)


### Name: UARS
### Title: Generic UARS Distribution
### Aliases: UARS duars puars ruars

### ** Examples

#Generate random rotations from the Cayley-UARS distribution with central orientation
#rotated about the y-axis through pi/2 radians
S <- as.SO3(c(0, 1, 0), pi/2)
Rs <- ruars(20, rangle = rcayley, kappa = 1, S = S)

rs <- mis.angle(Rs-S)                          #Find the associated misorientation angles
frs <- duars(Rs, dcayley, kappa = 10, S = S)   #Compute UARS density evaluated at each rotations
plot(rs, frs)

cdf <- puars(Rs, pcayley, S = S)               #By supplying 'pcayley', it is used to compute the
plot(rs, cdf)                                  #the CDF

ecdf <- puars(Rs, S = S)                       #No 'puars' arguement is supplied so the empirical
plot(rs, ecdf)                                 #cdf is returned



