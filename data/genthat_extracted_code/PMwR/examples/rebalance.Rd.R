library(PMwR)


### Name: rebalance
### Title: Rebalance Portfolio
### Aliases: rebalance replace_weight print.rebalance

### ** Examples

r <- rebalance(current = c(a = 100, b = 20),
               target  = c(a = 0.2, c = 0.3),
               price   = c(a = 1, b = 2, c = 3))
as.journal(r)

## replace_weight: the passed vectors must be named;
##                 'basket_3' is ignored because not
##                 component of weights is named
##                 'basket_3'

replace_weight(c(basket_1 = 0.3,
                 basket_2 = 0.7),
               basket_1 = c(a = 0.1, b = 0.4, c = .5),
               basket_2 = c(x = 0.1, y = 0.4, z = .5),
               basket_3 = c(X = 0.5, Z = 0.5),
               sep = "|")



