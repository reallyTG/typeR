library(phonTools)


### Name: polezero
### Title: Pole-zero Plots
### Aliases: polezero

### ** Examples

## example of a typical single-zero preemphasis filter
a = 1
b = c(1, -.94)
polezero (b, a)

#example of a complex-pole formant-style filter
a = c(1, -.3, .2)
b = c(1)
polezero (b, a)



