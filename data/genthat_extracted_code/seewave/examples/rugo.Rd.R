library(seewave)


### Name: rugo
### Title: Rugosity of a time wave
### Aliases: rugo
### Keywords: ts

### ** Examples

data(tico) ; tico <-tico@left
# rugosity of the original recording normalised
rugo(tico/max(tico))
# synthesis of white noise with the same duration as tico
noise <- noisew(d=length(tico)/22050, f=22050)
# tico is normalised to get similar amplitude with the noise
tico.norm <- tico/max(tico)
# addition of noise to tico
tico.noisy <- tico.norm + 0.5*noise
# new rugosity (higher) on normalised signal
rugo(tico.noisy/max(tico.noisy))



