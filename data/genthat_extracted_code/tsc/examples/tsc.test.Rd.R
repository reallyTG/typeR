library(tsc)


### Name: tsc.test
### Title: Likelihood-ratio Tests for Two-Sample Comparisons
### Aliases: tsc.test
### Keywords: methods

### ** Examples
##Ex.1 
x <- rnorm(57,0,1)
y <- rnorm(67,0,1)
##two-sample comparisons test for whether x and y are from normal distributions, 
##  and whether the mean of x is the equal to the mean of y, 
##  and whether the variance of x is the equal to the variance of y.
##  method in [4] is used to obtain the test statistic and corresponding p-value.
test_lrt<-tsc.test(x,y,method="TAS") 
##  combined method based on LRT and S-W via the Bonferroni techinque
##  is used to obtain the p-value. 
test_comb<-tsc.test(x,y,method="TAS&SW") 
##DBEL method is used to obtain the test statistics. 
##Monte carlo method is used to obtain the p-value with 1000 monte carlo simulations.
test_dbel1<-tsc.test(x,y,method="DBEL",t_m=1,mc=1000)
##DBEL method is used to obtain the test statistic. 
##The interpolation method based on the regression technique and tabulated critical values 
##  is used to obtain the p-value.
test_dbel2<-tsc.test(x,y,method="DBEL",t_m=2)
##DBEL method is used to obtain the test statistic. 
##The Bayesian method is used to obtain the p-value.
test_dbel3<-tsc.test(x,y,method="DBEL",t_m=3)

##Ex.2
A<- rnorm(15,0,1)
B<- runif(31,-1,1)
test_lrt1<-tsc.test(A,B,method="TAS") #p-value is 0.3656844.
test_comb1<-tsc.test(A,B,method="TAS&SW") #p-value is 0.02588757.
test_dbel4<-tsc.test(A,B,method="DBEL",t_m=1,mc=1000) #p-value is 0.001.
test_dbel5<-tsc.test(A,B,method="DBEL",t_m=2) #p-value is 0.001774751.
test_dbel6<-tsc.test(A,B,method="DBEL",t_m=3) #p-value is 0.008112455.
##B is not from the normal distribution, so the null hypothesis should be rejected.
##The LRT method does not reject H_0, since this methods work just for X~N and Y~N. 



