library(grouped)


### Name: residuals.grouped
### Title: Residuals for grouped objects
### Aliases: residuals.grouped
### Keywords: methods

### ** Examples


m1 <- grouped(cbind(lo, up) ~ treat * x, link = "logit", data = Sdata)
resid(m1)
    
m2 <- grouped(equispaced(r, n) ~ x1 * x2, link = "logit", data = Seeds)
resid(m2)




