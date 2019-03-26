library(swa)


### Name: swa
### Title: Subsampling Winner Algorithm for Variable Selection in the
###   Classification Setting
### Aliases: swa
### Keywords: classification, selection, subsampling. variable

### ** Examples

set.seed(1)
x <- matrix(rnorm(20*100), ncol=20)
b = c(0.5,1,1.5,2,3); 
y <- x[,1:5]%*%b + rnorm(100)
y <- as.numeric(y<0)
X <- t(x)
## No test: 
swa(X,y,c(3,5,10,15,20),5,500,MPplot = TRUE) ;
## End(No test)
## The MP plots show that the upper arm sets, i.e., the points above the elbow point of each 
## panel plot, started to be stabilized at s = 10. Thus, we fix s = 10 below.
sum_swa <- swa(X,y,10,5,500)
sum_swa 
## No test: 
## The final model perfectly recovers the five true variables. The stepwise selection removes
## X1, which has the weakest signal (hence is not expected to be recovered.) We next check the
## results with a larger m = 1000.
sum_swa <- swa(X,y,10,5,1000)   
sum_swa
# It now captured X2,X3,X4,X5, and also a noise variable X6 that is not as significant as the 
## former 4 covariates X2-X4. We next look at the estimates of all 20 coefficients including 
## those not selected.
coef_swa = numeric(20)
column_index = as.numeric(substring(rownames(sum_swa$step_sum$coef[-1,]),2,5))
coef_swa[column_index] <- sum_swa$step_sum$coef[-1,1]

#### Compare the coefficients from the SWA on all covariates with the coefficients from the 
## oracle LDA. We first calculate the coefficients from the oracle LDA.
n = 100
n0 = sum(y==0)
n1 = sum(y==1)
yy=y
yy[y==0] <- -n/n0 ;
yy[y==1] <- n/n1 ;
X = X[1:5,]
X = X - apply(X,1,median);
X = X/apply(X,1,mad) ;
designX = t(X) ;
colnames(designX) <- paste('X',1:5,sep='') ;
dataXY = data.frame(cbind(yy,designX)) ; dim(dataXY) ;
LDA <- lm(yy ~ ., data = dataXY)
sum_LDA <- summary(LDA)
coef_LDA = numeric(20)
coef_LDA[as.numeric(substring(rownames(sum_LDA$coef[-1,]),2,5))] <- sum_LDA$coef[-1,1]
####  Compare the coefficients using correlation.
cor(coef_swa,coef_LDA); rbind(coef_swa, coef_LDA); 
####  There is an excellent correlation between the coefficients recovered from the SWA on 
## the full data and the coefficients from the benchmark, ie., the oracle LDA.

####  Next we try on a set of smaller coefficients that should be harder to recover from 
## the noisy data
x <- matrix(rnorm(20*100), ncol=20)
b = c(0.3,0.6,0.9,1.2,1.5);
y <- x[,1:5]%*%b + rnorm(100)
y <- as.numeric(y<0)
X <- t(x)
swa(X,y,10,5,500) ;
####  SWA does a perfect job in recovering the true variables.
## End(No test)



