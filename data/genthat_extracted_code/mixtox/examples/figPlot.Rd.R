library(mixtox)


### Name: figPlot
### Title: Ploting concentration response curve
### Aliases: figPlot
### Keywords: concentration response curve

### ** Examples

## example 1
# 
x <- antibiotox$PAR$x
expr <- antibiotox$PAR$y
obj <- curveFit(x, expr, eq = 'Logit', rtype = 'quantal', param = c(26, 4), effv = c(0.05, 0.5))
figPlot(obj)

## example 2
# 
x <- hormesis$HmimCl$x
rspn <- hormesis$HmimCl$y
obj <- curveFit(x, rspn, eq = 'Biphasic', param = c(-0.59, 0.001, 160,0.05, 19),
         effv = c(0.05, 0.5), rtype = 'hormesis')
figPlot(obj, logT = TRUE)



