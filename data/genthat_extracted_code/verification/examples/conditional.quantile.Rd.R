library(verification)


### Name: conditional.quantile
### Title: Conditional Quantile Plot
### Aliases: conditional.quantile
### Keywords: file

### ** Examples


set.seed(10)
m<- seq(10, 25, length = 1000)  
frcst <- round(rnorm(1000, mean = m, sd = 2) )
obs<- round(rnorm(1000, mean = m, sd = 2 ))
bins <- seq(0, 30,1)
thrs<- c( 10, 20) # number of obs needed for a statistic to be printed #1,4 quartile, 2,3 quartiles

conditional.quantile(frcst, obs, bins, thrs, main = "Sample Conditional Quantile Plot")
#### Or plots a ``cont.cont'' class object.

obs<- rnorm(100)
pred<- rnorm(100)
baseline <- rnorm(100, sd = 0.5) 

A<- verify(obs, pred, baseline = baseline,  frcst.type = "cont", obs.type = "cont")
 plot(A)



