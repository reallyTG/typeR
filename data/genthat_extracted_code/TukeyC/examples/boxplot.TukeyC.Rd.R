library(TukeyC)


### Name: boxplot.TukeyC
### Title: Boxplot TukeyC Objects
### Aliases: boxplot.TukeyC
### Keywords: package

### ** Examples

##
## Examples: Completely Randomized Design (CRD)
## More details: demo(package='TukeyC')
##

library(TukeyC)
data(CRD1)

## From: formula
# Simple!
tk1 <- TukeyC(y ~ x,
              data=CRD1$dfm,
              which='x')
boxplot(tk1)

# A little more elaborate!
boxplot(tk1,
        mean.lwd=1.3,
        mean.col='red')

# A little more! 
boxplot(tk1,
        mean.lwd=1.3,
        mean.lty=2,
        mean.col='red',
        args.legend=list(x='bottomleft'))

# With point type!
boxplot(tk1,
        type='point')

# With other point
boxplot(tk1,
        type='point',
        mean.pch=3,
        mean.col='blue',
        args.legend=list(x='bottomleft'))




