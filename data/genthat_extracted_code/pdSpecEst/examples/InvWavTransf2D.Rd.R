library(pdSpecEst)


### Name: InvWavTransf2D
### Title: Inverse AI wavelet transform for surface of HPD matrices
### Aliases: InvWavTransf2D

### ** Examples

P <- rExamples2D(c(2^4, 2^4), 2, example = "tvar")
P.wt <- WavTransf2D(P$f) ## forward transform
P.f <- InvWavTransf2D(P.wt$D, P.wt$M0) ## backward transform
all.equal(P.f, P$f)




