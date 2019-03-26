library(robustbase)


### Name: scaleTau2
### Title: Robust Tau-Estimate of Scale
### Aliases: scaleTau2
### Keywords: robust univar

### ** Examples

x <- c(1:7, 1000)
sd(x) # non-robust std.deviation
scaleTau2(x)
scaleTau2(x, mu.too = TRUE)

if(doExtras <- robustbase:::doExtras()) {
 set.seed(11)
 ## show how much faster this is, compared to Qn
 x <- sample(c(rnorm(1e6), rt(5e5, df=3)))
 (system.time(Qx <- Qn(x)))         ## 2.04 [2017-09, lynne]
 (system.time(S2x <- scaleTau2(x))) ## 0.25    (ditto)
 cbind(Qn = Qx, sTau2 = S2x)
}##       Qn    sTau2
##  1.072556 1.071258



