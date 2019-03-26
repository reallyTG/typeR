library(lmomco)


### Name: are.parlmrq.valid
### Title: Are the Distribution Parameters Consistent with the Linear Mean
###   Residual Quantile Function Distribution
### Aliases: are.parlmrq.valid
### Keywords: utility (distribution) Distribution: Linear Mean Residual
###   Quantile Function utility (distribution, parameter validation)

### ** Examples

para <- parlmrq(lmoms(c(3, 0.05, 1.6, 1.37, 0.57, 0.36, 2.2)))
if(are.parlmrq.valid(para)) Q <- qualmrq(0.5,para)



