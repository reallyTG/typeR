library(yuima)


### Name: mllag
### Title: Multiple Lead-Lag Detector
### Aliases: mllag
### Keywords: ts

### ** Examples


# The first example is taken from llag

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
 
 ## We search lead-lag parameters on the interval [-0.1, 0.1] with step size 0.01 
G <- seq(-0.1,0.1,by=0.01)

## lead-lag estimation by mllag
par(mfcol=c(3,1))
result <- mllag(psample, grid = G)

## Since the lead-lag parameter for the pair(x1, x3) is not contained in G,
## no lead-lag parameter is detected for this pair

par(mfcol=c(1,1))

# The second example is a situation where multiple lead-lag effects exist
set.seed(222)

n <- 3600
Times <- seq(0, 1, by = 1/n)
R1 <- 0.6
R2 <- -0.3

dW1 <- rnorm(n + 10)/sqrt(n)
dW2 <- rnorm(n + 5)/sqrt(n)
dW3 <- rnorm(n)/sqrt(n)

x <- zoo(diffinv(dW1[-(1:10)] + dW2[1:n]), Times)
y <- zoo(diffinv(R1 * dW1[1:n] + R2 * dW2[-(1:5)] + 
                 sqrt(1- R1^2 - R2^2) * dW3), Times)

## In this setting, both x and y have a component leading to the other, 
## but x's leading component dominates y's one

yuima <- setData(list(x, y))

## Lead-lag estimation by llag
G <- seq(-30/n, 30/n, by = 1/n)
est <- llag(yuima, grid = G, ci = TRUE)

## The shape of the plotted cross-correlation is evidently bimodal,
## so there are likely two lead-lag parameters

## Lead-lag estimation by mllag
mllag(est) # succeeds in detecting two lead-lag parameters

## Next consider a non-synchronous sampling case
psample <- poisson.random.sampling(yuima, n = n, rate = c(0.8, 0.7))

## Lead-lag estimation by mllag
est <- mllag(psample, grid = G) 
est # detects too many lead-lag parameters

## Using a lower significant level
mllag(est, alpha = 0.001) # insufficient

## As the plot reveals, one reason is because the grid is too dense
## In fact, this phenomenon can be avoided by using a coarser grid
mllag(psample, grid = seq(-30/n, 30/n, by=5/n)) # succeeds!




