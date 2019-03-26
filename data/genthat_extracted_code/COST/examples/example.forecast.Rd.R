library(COST)


### Name: example.forecast
### Title: example for one-step ahead forecast
### Aliases: example.forecast

### ** Examples

library(COST)
#settings
seed1 = 2222222
n.total = 101 #number of total time points, including the burning sequence
n = 50 #number of time points we observed
example.forecast(n,n.total,seed1)
#OUTPUTS

# $COST.t.fore.ECP #whether the forecast interval includes the true value at n+1
# [1] 1 1 1 1 1 1 1 1 1
#
# $COST.t.fore.ML #length of the forecast interval
# [1] 0.7036 4.1318 4.8749 2.7615 3.7398 5.8186 4.4532 4.9251 6.3757
#
# $COST.t.fore.rank #multivariate rank
# [1] 162
#
#
# $COST.G.fore.ECP #whether the forecast interval includes the true value at n+1
# [1] 1 1 1 1 1 1 1 1 1
#
# $COST.G.fore.ML #length of the forecast interval
# [1]  0.7035 4.1316 4.8656 2.7611 3.7388 5.7913 4.4458 4.9036 6.3727
#
# $COST.G.fore.rank #multivariate rank
# [1] 186
#

# $GP.fore.ECP #whether the forecast interval includes the true value at n+1
# [1] 1 0 0 1 1 1 1 1 1
#
# $GP.fore.ML #length of the forecast interval
# [1] 0.4879 2.0449 3.4436 2.2107 2.9170 4.4537 4.2169 5.5789 7.3689
#
# $GP.fore.rank #multivariate rank
# [1] 17



