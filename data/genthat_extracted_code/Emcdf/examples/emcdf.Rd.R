library(Emcdf)


### Name: emcdf
### Title: Computes multivariate empirical joint distribution
### Aliases: emcdf

### ** Examples


n = 10^6
set.seed(123)
x = rnorm(n)
y = rnorm(n)
z = rnorm(n)
data = cbind(x, y, z)
#The aim is to compute F(0.5,0.5,0.5) with three
#approaches and compare the performances.
#To avoid CPU noises, we repeat the computation 10 times.
#compute with R built-in function, sum()
sum_time = system.time({
  aws1 = c()
  for(i in 1:10)
    aws1[i] = sum(x <= 0.5& y <=0.5& z <=0.5)/n
})[3]

#compute with emcdf single-thread
a = matrix(rep(c(0.5, 0.5, 0.5), 10), 10, 3)
single_time = system.time({
   aws2 = emcdf(data, a)
})[3]

obj = initF(data, 4)
multi_time = system.time({
   aws3 = emcdf(obj, a)
})[3]
aws2 == aws1
aws3 == aws1
sum_time
single_time
multi_time




