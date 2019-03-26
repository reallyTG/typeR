library(wavethresh)


### Name: BAYES.THR
### Title: Bayesian wavelet thresholding.
### Aliases: BAYES.THR
### Keywords: smooth

### ** Examples

#
# Generate some noisy test data and plot it.
#
blocks.data <- DJ.EX(n=512, noisy=TRUE)$blocks
#
# Now try BAYES.THR with the default parameters.
#
blocks.thr <- BAYES.THR(blocks.data, plotfn=TRUE)
#
# The default wavelet is Daubechies' least asymmetric wavelet 
# with 8 vanishing moments; quite a smooth wavelet. Since the 
# flat sections are still rather noisy, try Haar wavelets:
# 
blocks.thr <- BAYES.THR(blocks.data, plotfn=TRUE, filter.number=1,
        family = "DaubExPhase") 
#
# To show the importance of a sensible prior, consider alpha = 4, 
# beta = 1 (which implies a smoother prior than the default). 
#
blocks.thr <- BAYES.THR(blocks.data, plotfn=TRUE, filter.number=1,
        family = "DaubExPhase", alpha=4, beta=1)
#
# Here, the extreme values of the function are being smoothed towards zero.
#



