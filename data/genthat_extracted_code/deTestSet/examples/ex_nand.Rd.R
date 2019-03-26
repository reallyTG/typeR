library(deTestSet)


### Name: nand
### Title: Nand Gate, Index 1 IDE
### Aliases: nand
### Keywords: utilities

### ** Examples

out <- nand(method = "daspk")
plot(out, lwd = 2, which = 1:9)

# compare with reference solution
max(abs(out[nrow(out),-1] - reference("nand")))    



