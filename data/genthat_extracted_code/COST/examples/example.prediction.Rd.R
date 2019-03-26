library(COST)


### Name: example.prediction
### Title: example for new location prediction
### Aliases: example.prediction

### ** Examples

library(COST)
#settings
n.total = 101 #number of total time points, including the burning sequence
n = 50 #number of time points we observed
seed1 = 22222
example.prediction(n,n.total,seed1)

#OUTPUTS

# $COST.t.pre.ECP #whether the prediction interval includes the true value, time point n
# [1] 1 1 1 1
#
# $COST.t.pre.ML #length of the prediction interval
# [1] 1.445576 2.146452 2.260688 2.706681
#
# $COST.t.pre.med.error #point prediction error, using conditional median
# [1]  0.01127162 -0.03222058 -0.22081051  0.57831480
#
# $COST.G.pre.ECP #whether the prediction interval includes the true value, time point n
# [1] 1 1 1 1
#
# $COST.G.pre.ML #length of the prediction interval
# [1] 1.445576 2.432646 2.260688 2.914887
#
# $COST.G.pre.med.error #point prediction error, using conditional median
# [1] 0.01127162 -0.03222058 -0.22081051  0.57831480
#
# $GP.pre.ECP #whether the prediction interval includes the true value, time point n
# [1] 1 1 1 1
#
# $GP.pre.ML #length of the prediction interval
# [1] 0.8345359 1.4096642 1.5948724 2.3419428
#
# $GP.pre.med.error #point prediction error, using conditional median
# [1] 0.09447685 -0.05889409 -0.08923935  0.58494684



