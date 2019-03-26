library(tuneR)


### Name: periodogram-methods
### Title: Periodogram (Spectral Density) Estimation on Wave objects
### Aliases: periodogram periodogram,WaveGeneral-method
###   periodogram,character-method
### Keywords: ts

### ** Examples

# constructing a Wave object (1 sec.) containing sinus sound with 440Hz:
Wobj <- sine(440)
Wobj

# Calculate periodograms in windows of 4096 samples each - without
#   any overlap - resulting in an Wspec object that is printed:
Wspecobj <- periodogram(Wobj, width = 4096)
Wspecobj

# Plot the first periodogram from Wspecobj:
plot(Wspecobj)
# Plot the third one and choose a reasonable xlim:
plot(Wspecobj, which = 3, xlim = c(0, 1000))
# Mark frequency that has been generated before:
abline(v = 440, col="red")

FF(Wspecobj)              # all ~ 440 Hertz
noteFromFF(FF(Wspecobj))  # all diapason a



