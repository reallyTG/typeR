library(inflection)


### Name: findipiterplot
### Title: A Function to Show Implementation of BESE and BEDE Methods by
###   Plotting their Convergence
### Aliases: findipiterplot
### Keywords: inflection ese ede iterative bisection

### ** Examples

#
#Lets create some convex/concave data based on the Fisher-Pry model, without noise
f=function(x){5+5*tanh(x-5)};xa=0;xb=15;
set.seed(12345);x=sort(runif(5001,xa,xb));y=f(x);
#
t1=Sys.time();
a<-findipiterplot(x,y,0,TRUE,TRUE,FALSE);
t2=Sys.time();print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
#Time difference of 2.692897 secs
#Lets see available results
ls(a)
# [1] "aedmout" "aesmout" "BEDE"    "BESE"    "first"   "xydl"    "xysl"  
a$first;#Show first solution
#       i1   i2  chi_S,D
# ESE 1128 2072 4.835633
# EDE 1091 2221 4.999979
a$BESE;#Show ESE iterations
#                       1        2        3        4        5        6        7        8
# ESE iterations 4.835633 5.054775 4.978086 5.011331 4.993876 5.003637 4.998145 4.999782
a$BEDE;#Show EDE iterations
#                       1        2        3        4        5        6        7        8        
# EDE iterations 4.999979 4.996327 4.997657 5.001511 4.996464 5.000629 4.999149 4.999885 
#        9       10
# 5.000082 4.999782
a$aesmout;#Statistics and 95%c c.i. for ESE
#                mean      sdev   95%(l)   95%(r)
# ESE method 4.984408 0.0640699 4.930844 5.037972
a$aedmout;#Statistics and 95%c c.i. for EDE
#                mean        sdev   95%(l) 95%(r)
# EDE method 4.999146 0.001753223 4.997892 5.0004
#
#Look how bisection based method (BESE) converges in 8 steps...
#
lapply(a$xysl,summary);
# [[1]]
# x                   y           
# Min.   : 0.006405   Min.   : 0.00046  
# 1st Qu.: 3.802278   1st Qu.: 0.83521  
# Median : 7.583006   Median : 9.94325  
# Mean   : 7.504537   Mean   : 6.68942  
# 3rd Qu.:11.240944   3rd Qu.: 9.99996  
# Max.   :14.994895   Max.   :10.00000  
# 
#...
#
# 
# [[8]]
# x               y        
# Min.   :4.978   Min.   :4.891  
# 1st Qu.:4.988   1st Qu.:4.938  
# Median :5.004   Median :5.018  
# Mean   :4.999   Mean   :4.997  
# 3rd Qu.:5.009   3rd Qu.:5.043  
# Max.   :5.018   Max.   :5.090  
# 
# and BEDE in 10 steps:
#
lapply(a$xydl,summary)
# [[1]]
# x                   y           
# Min.   : 0.006405   Min.   : 0.00046  
# 1st Qu.: 3.802278   1st Qu.: 0.83521  
# Median : 7.583006   Median : 9.94325  
# Mean   : 7.504537   Mean   : 6.68942  
# 3rd Qu.:11.240944   3rd Qu.: 9.99996  
# Max.   :14.994895   Max.   :10.00000  
# 
# ...
# 
# [[10]]
# x               y        
# Min.   :4.982   Min.   :4.911  
# 1st Qu.:4.993   1st Qu.:4.965  
# Median :5.004   Median :5.019  
# Mean   :5.001   Mean   :5.007  
# 3rd Qu.:5.009   3rd Qu.:5.045  
# Max.   :5.018   Max.   :5.090  
#
# See also the pdf plots 'ese_iterations.pdf' and 'ede_iterations.pdf'



