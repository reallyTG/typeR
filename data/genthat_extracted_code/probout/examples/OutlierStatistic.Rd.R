library(probout)


### Name: OutlierStatistic
### Title: Nonparametric Outlier Statistic
### Aliases: OutlierStatistic
### Keywords: nonparametric

### ** Examples


 stat <- OutlierStatistic(faithful)
 q.99 <- quantile(stat,.99)
 out <- stat > q.99

 plot( faithful[,1], faithful[,2], 
       main="red : .99 quantile for outlier statistic", cex=.5)
 points( faithful[out,1], faithful[out,2], 
         pch = 4, col = "red", lwd = 1, cex = .5)

 require(mvtnorm)

 set.seed(0)
 Sigma <- crossprod(matrix(rnorm(2*2),2,2))
 x <- rmvt( 10000, sigma = Sigma, df = 2) 

 stat <- OutlierStatistic(x)
 q.95 <- quantile(stat,.95)

 hist(x, main = "gray : .95 quantile for outlier statistic", col = "black")
 abline( v = x[stat > q.95], col = "gray")
 hist(x, col = "black", add = TRUE)



