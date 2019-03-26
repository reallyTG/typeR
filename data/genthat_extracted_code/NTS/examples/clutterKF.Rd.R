library(NTS)


### Name: clutterKF
### Title: Kalman Filter for Tracking in Clutter
### Aliases: clutterKF

### ** Examples

nobs <- 100; pd <- 0.95; ssw <- 0.1; ssv <- 0.5;
xx0 <- 0; ss0 <- 0.1; nyy <- 50;
yrange <- c(-80,80); xdim <- 2; ydim <- nyy;
simu <- simuTargetClutter(nobs,pd,ssw,ssv,xx0,ss0,nyy,yrange)
outKF <- clutterKF(nobs,ssw,ssv,simu$yy,simu$ii)



