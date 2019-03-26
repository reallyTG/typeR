library(yuima)


### Name: llag
### Title: Lead Lag Estimator
### Aliases: llag llag,list-method
### Keywords: ts

### ** Examples


## Set a model
diff.coef.matrix <- matrix(c("sqrt(x1)", "3/5*sqrt(x2)",
 "1/3*sqrt(x3)", "", "4/5*sqrt(x2)","2/3*sqrt(x3)",
 "","","2/3*sqrt(x3)"), 3, 3) 
drift <- c("1-x1","2*(10-x2)","3*(4-x3)")
cor.mod <- setModel(drift = drift, 
 diffusion = diff.coef.matrix,
 solve.variable = c("x1", "x2","x3")) 

set.seed(111) 

## We use a function poisson.random.sampling 
## to get observation by Poisson sampling.
yuima.samp <- setSampling(Terminal = 1, n = 1200) 
yuima <- setYuima(model = cor.mod, sampling = yuima.samp) 
yuima <- simulate(yuima,xinit=c(1,7,5)) 

## intentionally displace the second time series

  data2 <- yuima@data@zoo.data[[2]]
  time2 <- time(data2)
  theta2 <- 0.05   # the lag of x2 behind x1
  stime2 <- time2 + theta2  
  time(yuima@data@zoo.data[[2]]) <- stime2

  data3 <- yuima@data@zoo.data[[3]]
  time3 <- time(data3)
  theta3 <- 0.12   # the lag of x3 behind x1
  stime3 <- time3 + theta3 
  time(yuima@data@zoo.data[[3]]) <- stime3




## sampled data by Poisson rules
psample<- poisson.random.sampling(yuima, 
 rate = c(0.2,0.3,0.4), n = 1000) 


## plot
plot(psample)


## cce
cce(psample)

## lead-lag estimation (with cross-correlation plots)
par(mfcol=c(3,1))
result <- llag(psample, plot=TRUE)

## estimated lead-lag parameter
result

## computing pointwise confidence intervals
llag(psample, ci = TRUE)

## In practice, it is better to specify the grid because the default grid contains too many points.
## Here we give an example for how to specify it.

## We search lead-lag parameters on the interval [-0.1, 0.1] with step size 0.01 
G <- seq(-0.1,0.1,by=0.01)

## lead-lag estimation (with computing confidence intervals)
result <- llag(psample, grid = G, ci = TRUE)

## Since the true lead-lag parameter 0.12 between x1 and x3 is not contained
## in the searching grid G, we see that the corresponding cross-correlation 
## does not exceed the cofidence interval

## detailed output
## the p-value for the (1,3)-th component is high
result

## Finally, we can examine confidence intervals of other significant levels
## and/or without the Fisher z-transformation via the plot-method defined 
## for yuima.llag-class objects as follows
plot(result, alpha = 0.001)
plot(result, fisher = FALSE)

par(mfcol=c(1,1))




