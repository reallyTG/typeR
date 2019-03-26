library(dblcens)


### Name: d011ch
### Title: Compute NPMLE of CDF from doubly censored data, with and without
###   a constraint, plus an empirical likelihood ratio
### Aliases: d011ch
### Keywords: survival nonparametric

### ** Examples

d011ch(z=c(1,2,3,4,5), d=c(1,0,2,2,1), K=3.5, konst=0.6)
#
# Here we are testing Ho: F(3.5) = 0.6 with a two-sided alternative
# you should get something like
#
#       $time:
#       [1] 1.0 2.0 2.5 5.0    (notice the times, (3,4), corresponding
#                                   to d=2 are removed, and time 2.5 added
#       $status:               since there is a (0,2) pattern at
#       [1]  1  0 -1  1        times 2, 3. The status indicator of -1
#                                   show that it is an added time )
#       $surv
#       [1] 0.5000351 0.5000351 0.3333177 0.0000000
#
#       $jump
#       [1] 0.4999649 0.0000000 0.1667174 0.3333177
#
#       $exttime
#       [1] 1.0 2.0 2.5 3.0 4.0 5.0       (exttime include all the times,
#                                         censor or not, plus the added time)
#       $extstatus
#       [1]  1  0 -1  2  2  1
#
#       $extjump
#       [1] 0.4999649 0.0000000 0.1667174 0.0000000 0.0000000 0.3333177
#
#       $extsurv.Sx
#       [1] 0.5000351 0.5000351 0.3333177 0.3333177 0.3333177 0.0000000
#
#       $konstdist
#       [1] 0.4999365 0.4999365 0.6000000 0.6000000 0.6000000 1.0000000
#
#       $konstjump
#       [1] 0.4999365 0.0000000 0.1000635 0.0000000 0.0000000 0.4000000
#
#       $konsttime
#       [1] 3.5
#
#       $theta
#       [1] 0.6
#
#       $"-2loglikR"                  (the Wilks statistics to test Ho:
#       [1] 0.05679897                  F(K)=konst)
#
#       $maxiter
#       [1] 33
#
#  The Wilks statistic is 0.05679897, there is no evidence against Ho: F(3.5)=0.6



