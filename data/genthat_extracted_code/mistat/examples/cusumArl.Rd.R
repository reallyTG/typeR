library(mistat)


### Name: cusumArl
### Title: Cumulative Sum Control Charts Average Run Length
### Aliases: cusumArl
### Keywords: nonparametric ts

### ** Examples

cusumArl(mean=1, seed=123, N=100, limit=1000)

cusumArl(size=100, prob=0.05, kp=5.95, km=3.92, hp=12.87, hm=-8.66, 
  randFunc=rbinom, seed=123, N=100, limit=2000)
  
cusumArl(lambda=10, kp=12.33, km=8.41, hp=11.36, hm=-12.91, 
  randFunc=rpois, seed=123, N=100, limit=2000)



