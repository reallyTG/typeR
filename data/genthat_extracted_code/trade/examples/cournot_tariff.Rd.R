library(trade)


### Name: cournot_tariff
### Title: Tariff Simulation With A Cournot Quantity Setting Game
### Aliases: cournot_tariff

### ** Examples

## Simulate the effect of a 75% ad valorem tariff in a
## 5-firm, single-product market with linear demand and quadratic costs
## Firm 1 is assumed to be foreign, and so subject to a tariff


n <- 5 #number of firms in market
cap <- rnorm(n,mean = .5, sd = .1)
int <- 10
slope <- -.25
tariffPre <- tariffPost <- rep(0, n)
tariffPost[1] <- .75

B.pre.c = matrix(slope,nrow=n,ncol=n)
diag(B.pre.c) = 2* diag(B.pre.c) - 1/cap
quantity.pre.c = rowSums(solve(B.pre.c) * -int)
price.pre.c = int + slope * sum(quantity.pre.c)
mc.pre.c = quantity.pre.c/cap
vc.pre.c = quantity.pre.c^2/(2*cap)
margin.pre.c = 1 - mc.pre.c/price.pre.c

#prep inputs for Cournot
owner.pre <- diag(n)



result.c <- cournot_tariff(prices = price.pre.c,quantities = as.matrix(quantity.pre.c),
                    margins=as.matrix(margin.pre.c),
                    owner=owner.pre,
                    tariffPre =  as.matrix(tariffPre),
                    tariffPost = as.matrix(tariffPost))

summary(result.c, market = TRUE)         # summarize tariff (high-level)
summary(result.c, market = FALSE)         # summarize tariff (detailed)




