library(pdSpecEst)


### Name: InvWavTransf1D
### Title: Inverse AI wavelet transform for curve of HPD matrices
### Aliases: InvWavTransf1D

### ** Examples

P <- rExamples1D(2^8, example = "bumps")
P.wt <- WavTransf1D(P$f) ## forward transform
P.f <- InvWavTransf1D(P.wt$D, P.wt$M0) ## backward transform
all.equal(P.f, P$f)




