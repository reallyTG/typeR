library(lmomco)


### Name: lmomemu
### Title: L-moments of the Eta-Mu Distribution
### Aliases: lmomemu
### Keywords: L-moment (distribution) Distribution: Eta-Mu

### ** Examples

## Not run: 
##D emu <- vec2par(c(.19,2.3), type="emu")
##D lmomemu(emu)
##D 
##D par <- vec2par(c(.67, .5), type="emu")
##D lmomemu(par)$lambdas
##D cdf2lmoms(par, nmom=4)$lambdas
##D system.time(lmomemu(par))
##D system.time(cdf2lmoms(par, nmom=4))
##D 
##D # This extensive sequence of operations provides very important
##D # perspective on the L-moment ratio diagram of L-skew and L-kurtosis.
##D # But more importantly this example demonstrates the L-moment
##D # domain of the Kappa-Mu and Eta-Mu distributions and their boundaries.
##D #
##D t3 <- seq(-1,1,by=.0001)
##D plotlmrdia(lmrdia(), xlim=c(-0.05,0.5), ylim=c(-0.05,.2))
##D # The following polynomials are used to define the boundaries of
##D # both distributions. The applicable inequalities for these
##D # are not provided for these polynomials as would be in deeper
##D # implementation---so don't worry about wild looking trajectories.
##D "KMUup" <- function(t3) {
##D              return(0.1227 - 0.004433*t3 - 2.845*t3^2 +
##D                     + 18.41*t3^3 - 50.08*t3^4 + 83.14*t3^5 +
##D                     - 81.38*t3^6 + 43.24*t3^7 - 9.600*t3^8)}
##D 
##D "KMUdnA" <- function(t3) {
##D               return(0.1226 - 0.3206*t3 - 102.4*t3^2 - 4.753E4*t3^3 +
##D                      - 7.605E6*t3^4 - 5.244E8*t3^5 - 1.336E10*t3^6)}
##D 
##D "KMUdnB" <- function(t3) {
##D               return(0.09328 - 1.488*t3 + 16.29*t3^2 - 205.4*t3^3 +
##D                      + 1545*t3^4 - 5595*t3^5 + 7726*t3^6)}
##D 
##D "KMUdnC" <- function(t3) {
##D               return(0.07245 - 0.8631*t3 + 2.031*t3^2 - 0.01952*t3^3 +
##D                      - 0.7532*t3^4 + 0.7093*t3^5 - 0.2156*t3^6)}
##D 
##D "EMUup" <- function(t3) {
##D               return(0.1229 - 0.03548*t3 - 0.1835*t3^2 + 2.524*t3^3 +
##D                      - 2.954*t3^4 + 2.001*t3^5 - 0.4746*t3^6)}
##D 
##D # Here, we are drawing the trajectories of the tabulated parameters
##D # and L-moments within the internal storage of lmomco.
##D lines(.lmomcohash$EMU_lmompara_byeta$T3,
##D       .lmomcohash$EMU_lmompara_byeta$T4,   col=7, lwd=0.5)
##D lines(.lmomcohash$KMU_lmompara_bykappa$T3,
##D       .lmomcohash$KMU_lmompara_bykappa$T4, col=8, lwd=0.5)
##D 
##D # Draw the polynomials
##D lines(t3, KMUdnA(t3), lwd=4, col=2, lty=4)
##D lines(t3, KMUdnB(t3), lwd=4, col=3, lty=4)
##D lines(t3, KMUdnC(t3), lwd=4, col=4, lty=4)
##D lines(t3, EMUup(t3),  lwd=4, col=5, lty=4)
##D lines(t3, KMUup(t3),  lwd=4, col=6, lty=4)
## End(Not run)



