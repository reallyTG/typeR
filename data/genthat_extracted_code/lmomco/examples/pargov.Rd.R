library(lmomco)


### Name: pargov
### Title: Estimate the Parameters of the Govindarajulu Distribution
### Aliases: pargov
### Keywords: distribution (parameters) Distribution: Govindarajulu

### ** Examples

lmr <- lmoms(rnorm(20))
pargov(lmr)

lmr <- vec2lmom(c(1391.8, 215.68, 0.01655, 0.09628))
pargov(lmr)$para             # see below
#         xi       alpha        beta 
# 868.148125 1073.740595    2.100971 
pargov(lmr, xi=868)$para     # see below
#         xi       alpha        beta 
# 868.000000 1074.044324    2.100971 
pargov(lmr, xi=100)$para     # see below
#         xi       alpha        beta 
# 100.000000 2648.817215    2.100971 



