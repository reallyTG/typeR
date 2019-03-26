library(rpsychi)


### Name: rpsychi-package
### Title: Statistics for psychiatric research
### Aliases: rpsychi-package rpsychi
### Keywords: package

### ** Examples

##Kline (2004) Table 6.15
my.cont <- matrix(c(-5,-3,-1,1,3,5,
                   5,-1,-4,-4,-1,5), ncol=6, nrow=2, byrow=TRUE)
dep.oneway.second(m = c(11.77,21.39,27.5,31.02,32.58,34.2), 
                  sd = c(7.6,8.44,8.95,9.21,9.49,9.62), 
                  n = 137, 
                  corr=lower2R(c(.77,.59,.50,.48,.46,.81,.72,.69,.68,.89,
                  .84,.8,.91,.88,.93)),
                  contr=my.cont)



