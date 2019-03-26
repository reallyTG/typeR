library(control)


### Name: tf
### Title: Create Transfer function Model.
### Aliases: tf

### ** Examples

tf(1, c(1,2,1))
sys1 <- tf(1, c(1,2,1))
sys1$num
sys1$den

## Not run:   for single-input multi-output systems (SIMO) each numerator row for one output 
num = rbind(c(0,1,1), c(1,0,1))
den = rbind(c(1,3,2))
tf(num, den)




