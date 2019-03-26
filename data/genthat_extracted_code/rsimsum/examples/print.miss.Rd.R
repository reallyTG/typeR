library(rsimsum)


### Name: print.miss
### Title: print.miss
### Aliases: print.miss

### ** Examples

library(rsimsum)
data("frailty", package = "rsimsum")
m <- miss(data = frailty, estvarname = "b", se = "se", par = "par",
            methodvar = "model", by = "fv_dist")
print(m)
print(m, fmt = "%.2f")



