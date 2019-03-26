library(rpsychi)


### Name: dep.oneway.second
### Title: A one-way design with dependent samples using published work:
###   Reporting effect size
### Aliases: dep.oneway.second
### Keywords: design htest

### ** Examples
 
##Kline (2004) Table 6.3
dat <- data.frame(y = c(9,12,13,15,16,
                       8,12,11,10,14,
                       10,11,13,11,15),
                  x =  rep(factor(c("a","b","c")), each=5),
                  subj = rep(paste("s", 1:5, sep=""), times=3)
                  )
dep.oneway(formula = y~x, data=dat, block="subj")

datwide <- reshape(dat, direction="wide", idvar="subj", timevar="x")
tmp <- datwide[,-1]
dep.oneway.second(m = apply(tmp, 2, mean), apply(tmp, 2, sd), n = nrow(tmp), corr=cor(tmp))



##Kline (2004) Table 6.15
my.cont <- matrix(c(-5,-3,-1,1,3,5,
                   5,-1,-4,-4,-1,5), ncol=6, nrow=2, byrow=TRUE)
dep.oneway.second(m = c(11.77,21.39,27.5,31.02,32.58,34.2), 
                  sd = c(7.6,8.44,8.95,9.21,9.49,9.62), 
                  n = 137, 
                  corr=lower2R(c(.77,.59,.50,.48,.46,.81,.72,.69,.68,.89,
                  .84,.8,.91,.88,.93)),
                  contr=my.cont)



