library(phonTools)


### Name: findformants
### Title: Find Formants
### Aliases: findformants

### ** Examples

## make a synthetic vowel with a known set of formant frequencies
## and bandwidths
sound = vowelsynth (ffs = c(500,1500,2500,3500,4500),
                    fbw = c(30, 90, 150, 210, 270), f0 = 100)

## compare different plotting options					
findformants (sound)
#findformants (sound, showrejected = FALSE)
#findformants (sound, showbws = TRUE)



