library(flexmet)


### Name: b2greek
### Title: Find the Greek-Letter Parameterization corresponding to a b
###   Vector of Item Parameters
### Aliases: b2greek

### ** Examples


(bvec <- greek2b(xi = 0, omega = 1, alpha = c(.1, .1), tau = c(-2, -2)))
## 0.00000000  2.71828183 -0.54365637  0.29961860 -0.03950623  0.01148330

(b2greek(bvec))
##  0.0  1.0  0.1 -2.0  0.1 -2.0




