library(mvLSW)


### Name: Spectrum2Transfer
### Title: Convert Between mvEWS and Transfer Function Matrices
### Aliases: Spectrum2Transfer
### Keywords: Spectrum2Transfer

### ** Examples

## Define evolutionary wavelet spectrum, structure only on level 2
Spec <- array(0, dim=c(3, 3, 8, 256)) ## Ensure all are positive def.
Spec[1, 1, 2, ] <- 10
Spec[2, 2, 2, ] <- c(rep(5, 64), rep(0.6, 64), rep(5, 128))
Spec[3, 3, 2, ] <- c(rep(2, 128), rep(8, 128))
Spec[2, 1, 2, ] <- Spec[1, 2, 2, ] <- punif(1:256, 65, 192)
Spec[3, 1, 2, ] <- Spec[1, 3, 2, ] <- c(rep(-1, 128), rep(5, 128))
Spec[3, 2, 2, ] <- Spec[2, 3, 2, ] <- -0.5

## Define EWS as mvLSW object
EWS <- as.mvLSW(x = Spec, filter.number = 1, family = "DaubExPhase",
  min.eig.val = NA)
plot(EWS, style = 2, info = 2)

## EWS to Transfer function matrices
Transfer <- Spectrum2Transfer(object = EWS, S2V = TRUE)

## Transfer function matrices to EWS
EWS2 <- Spectrum2Transfer(object = Transfer, S2V = FALSE)
plot(EWS2, style = 2, info = 2)



