library(deTestSet)


### Name: andrews
### Title: Andrews Squeezing Mechanism, Index 3 DAE
### Aliases: andrews
### Keywords: utilities

### ** Examples

out <- andrews()
plot(out, lwd = 2, which = 1:9)

refsol <- reference("andrews")
max(abs(out[nrow(out),-1] - refsol)/refsol)    



