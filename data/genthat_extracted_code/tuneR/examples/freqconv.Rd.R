library(tuneR)


### Name: freqconv
### Title: Frequency scale conversion
### Aliases: bark2hz hz2bark mel2hz hz2mel

### ** Examples

hz2bark(440)
bark2hz(hz2bark(440))
hz2mel(440, htk = TRUE)
mel2hz(hz2mel(440, htk = TRUE), htk = TRUE)
hz2mel(440, htk = FALSE)
mel2hz(hz2mel(440, htk = FALSE), htk = FALSE)



