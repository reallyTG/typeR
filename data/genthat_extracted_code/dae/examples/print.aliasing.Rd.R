library(dae)


### Name: print.aliasing
### Title: Print an aliasing data.frame
### Aliases: print.aliasing
### Keywords: array projector

### ** Examples

## Generate a data.frame with 3 factors length 12
pseudo.lay <- data.frame(pl = factor(1:12),
                         ab = factor(rep(1:4, times=3)),
                         a = factor(rep(1:2, times=6)))


## create a pstructure object
trt.struct <- pstructure(~ ab+a, data = pseudo.lay)

## print the object either using the Method function, the generic function or show
print.aliasing(trt.struct$aliasing)
print(trt.struct$aliasing, which.criteria = "none")
trt.struct$aliasing



