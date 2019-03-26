library(rSFA)


### Name: sfa2
### Title: The SFA2 algorithm, SFA with degree 2 expansion.
### Aliases: sfa2

### ** Examples

## prepare input data for simple demo
t=seq.int(from=0,by=0.011,to=2*pi)
x1=sin(t)+cos(11*t)^2
x2=cos(11*t)
x=data.frame(x1,x2)
## perform sfa2 algorithm with data
res = sfa2(x)
## plot slowest varying function of result
plot(t, res$y[,1],type="l",main="output of the slowest varying function")
## see http://www.scholarpedia.org/article/Slow_feature_analysis#The_algorithm
## for detailed description of this example



