library(controlTest)


### Name: quantileSE
### Title: Find standard error for survival quantile
### Aliases: quantileSE

### ** Examples

#Reference: Survival Analysis Techniques for Censored and Truncated Data.
#Klein and Moeschberger (1997) Springer.
#Data: Chapter 7.6 Example 7.9 (p. 211)
library(controlTest)
t1 <- c(1, 63, 105, 129, 182, 216, 250, 262, 301, 301,
       342, 354, 356, 358, 380, 383, 383, 338, 394, 408, 460, 489,
       499, 523, 524, 535, 562, 569, 675, 676, 748, 778, 786, 797,
       955, 968, 1000, 1245, 1271, 1420, 1551, 1694, 2363, 2754, 2950)
c1 <- c(rep(1, 43), 0, 0)
quantileSE(timevar = t1, censor = c1, q = 0.5, B = 500)



