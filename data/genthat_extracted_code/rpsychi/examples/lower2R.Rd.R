library(rpsychi)


### Name: lower2R
### Title: Convert a vector containing correlations into a correlation
###   matrix
### Aliases: lower2R
### Keywords: array

### ** Examples

lower2R(c(1:15))

##Kline (2004) Table 6.15
lower2R(c(.77,.59,.50,.48,.46,.81,.72,.69,.68,.89,
        .84,.8,.91,.88,.93))

lower2R(c(.77,.59,.50,.48,.46,.81,.72,.69,.68,.89,
        .84,.8,.91,.88,.93), 
        varname=paste("trial", 1:6, sep=""))



