library(mixtox)


### Name: qq4res
### Title: Residual Normal QQ Plot
### Aliases: qq4res
### Keywords: normal QQ plot

### ** Examples

## example 1
# 
x <- antibiotox$PAR$x
expr <- antibiotox$PAR$y
obj <- curveFit(x, expr, eq = 'Logit', rtype = 'quantal', param = c(26, 4), effv = c(0.05, 0.5))
qq4res(obj)



