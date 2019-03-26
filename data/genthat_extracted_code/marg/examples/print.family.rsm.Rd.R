library(marg)


### Name: print.family.rsm
### Title: Use print() on a "family.rsm" object
### Aliases: print.family.rsm
### Keywords: internal methods print

### ** Examples

student(df = 3) ## generates Student's t error distribution family
## 
## g  :  function (y, df, ...)  (df + 1)/2 * log(1 + y^2/df)
## g' :  function (y, df, ...)  (df + 1) * y/(df + y^2)
## g'':  function (y, df, ...)  (df + 1) * (df - y^2)/(df + y^2)^2
##
## df : 3
unclass(student(df = 3))
## $family
## [1] "student"
##
## $g0
## function(y,df,...)  (df+1)/2*log(1+y^2/df)
##
## $g1
## function(y,df,...)  (df+1)*y/(df+y^2)
##
## $g2
## function(y,df,...)  (df+1)*(df-y^2)/(df+y^2)^2
##
## $df
## [1] 3
##
## $k
## NULL



