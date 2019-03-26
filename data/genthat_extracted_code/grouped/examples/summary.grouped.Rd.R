library(grouped)


### Name: summary.grouped
### Title: Summary method for grouped objects
### Aliases: summary.grouped
### Keywords: methods

### ** Examples


m1 <- grouped(cbind(lo, up) ~ treat * x, link = "logit", data = Sdata)
summary(m1)
    
m2 <- grouped(equispaced(r, n) ~ x1 * x2, link = "logit", data = Seeds)
summary(m2)




