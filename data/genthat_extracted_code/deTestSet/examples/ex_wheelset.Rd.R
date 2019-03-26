library(deTestSet)


### Name: wheelset
### Title: Wheel Set problem, mechanics, Index 2 IDE
### Aliases: wheelset
### Keywords: utilities

### ** Examples

out <- wheelset()
plot(out, which = 1:9, lwd = 2)
max(abs(out[nrow(out), -1] - reference("wheelset")))



