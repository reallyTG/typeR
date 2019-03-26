library(BootWPTOS)


### Name: WPTOSpickout
### Title: Find nonstationarities in a time series
### Aliases: WPTOSpickout
### Keywords: ts

### ** Examples

#
# Create some simulated data
#
x2 <- c(rnorm(256), rnorm(256, 2))
#
# The following call to BootWPTOS (generic tester) 
#
## Not run: x2.tos <- BootWPTOS(x2, levs=5, indices=1, Bsims=500)
## Not run: x2.tos
#
#	WPBootTOS test of stationarity
#
#data:  x2
#= 5.2826, p-value < 2.2e-16
#
# So, test indicates that strong evidence for nonstationarity. 
#
# Now let's do the multiple Haar hypothesis test.
#
x2.po <- WPTOSpickout(x=x2, level=7, index=1)
x2.po
#Class 'toswp' : Wavelet Packet Test of Stationarity Object :
#       ~~~~  : List with 7 components with names
#              x level index sigcoefs nreject ntests bonsize 
#
#
#summary(.):
#----------
#Number of individual tests: 56 
#Bonferroni p-value was: 0.0008928571 
#Tests rejected: 2 
#Listing Bonferroni rejects...
#Wavelet Packet  (5,1): HWTlev: 4. Indices: 8  
#Wavelet Packet  (5,1): HWTlev: 5. Indices: 16 
#
# So, this test also shows nonstationarities. For this packet (5,1)
# two significant Haar coefficients were identified. One was at level 4
# position 8 and the other was at scale level 5 position 16.
#
# You can plot them also
#
## Not run: plot(x2.po)
#
# You should get a nice plot of the time series with double-headed red
# arrows indicating the location and extent of the nonstationarities.
# For this example, where the spectrum changes dramatically at the halfway
# point - this is where the arrows should be located. Of course, with random
# data you might see other arrows in other locations, but this should be
# unlikely and on repeating the above they should not persist.



