library(emplik)


### Name: ROCnp2
### Title: Test the ROC curve by Empirical Likelihood
### Aliases: ROCnp2
### Keywords: nonparametric htest

### ** Examples

#### An example of testing the equality of two medians. 
#### No censoring. 
# ROCnp2(t1=rexp(100), d1=rep(1,100), t2=rexp(120), 
#                              d2=rep(1,120), b0=0.5, t0=0.5)
###############################################################
#### This example do not work on the Solaris Sparc machine. 
#### But works fine on other platforms.
###########
#### Next, an example of finding 90 percent confidence 
#### interval of R(0.5)
####  Note: We are finding confidence interval for R(0.5). 
#### So we are testing  
####  R(0.5)= 0.35, 0.36, 0.37, 0.38, etc. try to find 
#### values so that testing R(0.5) = L , U has p-value 
#### of 0.10, then [L,  U] is the 90 percent
####  confidence interval for R(0.5).
#set.seed(123)
#t1 <- rexp(200)
#t2 <- rexp(200)
#ROCnp( t1=t1, d1=rep(1, 200), t2=t2, d2=rep(1, 200), 
#                                b0=0.5, t0=0.5)$"-2LLR"
#### since the -2LLR value is less than  
#### 2.705543 = qchisq(0.9, df=1),  so the 
#### confidence interval contains 0.5.
#gridpoints <- 35:65/100
#ELvalues <- gridpoints
#for(i in 1:31) ELvalues[i] <- ROCnp2(t1=t1, d1=rep(1, 200), 
#      t2=t2, d2=rep(1, 200), b0=gridpoints[i], t0=0.5)$"-2LLR"
#myfun1 <- approxfun(x=gridpoints, y=ELvalues)
#uniroot(f=function(x){myfun1(x)-2.705543}, 
#                                interval= c(0.35, 0.5) )
#uniroot(f= function(x){myfun1(x)-2.705543}, 
#                                interval= c(0.5, 0.65) )
#### So, taking the two roots, we see the 90 percent 
#### confidence interval for R(0.5) in this 
#### case is [0.4457862,  0.5907723].
###############################################



