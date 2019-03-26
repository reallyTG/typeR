library(brt)


### Name: dtavg
### Title: Average of the Student t Distribution
### Aliases: dtavg ptavg
### Keywords: distribution

### ** Examples

x=seq(from=-10, to=10, length.out=100)
ggplot2::qplot(x, ptavg(x, df=3, hi=3), geom='line')



