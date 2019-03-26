library(PMwR)


### Name: rc
### Title: Return Contribution
### Aliases: rc

### ** Examples

weights <- rbind(c( 0.25, 0.75),
                 c( 0.40, 0.60),
                 c( 0.25, 0.75))

R <- rbind(c( 1  ,    0),
           c( 2.5, -1.0),
           c(-2  ,  0.5))/100

rc(R, weights, segment = c("equities", "bonds"))



