library(LS2W)


### Name: D2autoplot
### Title: Plots a two-dimensional autocorrelation wavelet.
### Aliases: D2autoplot
### Keywords: models

### ** Examples

#
# To produce the Haar 2-D discrete autocorrelation wavelet at level -6 
# in the diagonal horizontal direction type
#
 D2ACW(J=-6, filter.number=1, family="DaubExPhase")
#
#Now let's look at the actual autocorrelation wavelet at that level
#

 D2autoplot(J=-6, filter.number=1, family="DaubExPhase", scaling="Haar")



