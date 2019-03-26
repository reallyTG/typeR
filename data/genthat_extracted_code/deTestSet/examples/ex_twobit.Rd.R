library(deTestSet)


### Name: twobit
### Title: The Two Bit Adding Unit, Index 1 DAE
### Aliases: twobit
### Keywords: utilities

### ** Examples


out <- twobit(times = seq(0, 100, by = 0.5))
plot(out, lwd = 2, which = c("x49", "x130", "x148"), mfrow = c(3, 1))

## Not run: 
##D   out <- twobit()
##D # compare with reference solution
##D   max(abs(out[nrow(out),-1] - reference("twobit")))    
## End(Not run)



