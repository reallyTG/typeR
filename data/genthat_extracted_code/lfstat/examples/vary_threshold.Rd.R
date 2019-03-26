library(lfstat)


### Name: vary_threshold
### Title: Create varying thresholds
### Aliases: vary_threshold
### Keywords: low-flow

### ** Examples

data(ngaruroro)
ng <- as.xts(ngaruroro)["1983::1985", ]
r <- find_droughts(ng, varying = "monthly")
plot(r)

thr1 <- vary_threshold(ng, varying = "weekly", fun = mean, na.rm = TRUE)
plot(thr1)

thr2 <- vary_threshold(ng, varying = "monthly", fun = mean, na.rm = TRUE)
lines(thr2, col = 2)



