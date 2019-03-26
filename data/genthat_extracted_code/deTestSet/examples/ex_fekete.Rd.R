library(deTestSet)


### Name: fekete
### Title: Elliptic Fekete Points, Mechanical Problem, Index 2 DAE
### Aliases: fekete
### Keywords: utilities

### ** Examples

out <- fekete()
plot(out, lwd = 2, which = 1:20)

# reference run compared with output at end of interval for first 7 components
out1 <- fekete(times = c(0, 1000))
max(abs(out1[nrow(out1),-1] - reference("fekete")))    



