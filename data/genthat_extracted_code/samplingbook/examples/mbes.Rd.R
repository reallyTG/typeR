library(samplingbook)


### Name: mbes
### Title: Model Based Estimation
### Aliases: mbes

### ** Examples

## 1) simple suppositious example
data(pop)
# Draw a random sample of size=3
set.seed(802016)
data <- pop[sample(1:5, size=3),]
names(data) <- c('id','x','y')
# difference estimator
mbes(formula=y~x, data=data, aux=15, N=5, method='diff', level=0.95)
# ratio estimator
mbes(formula=y~x, data=data, aux=15, N=5, method='ratio', level=0.95)
# regression estimator
mbes(formula=y~x, data=data, aux=15, N=5, method='regr', level=0.95)

## 2) Bundestag election
data(election)
# draw sample of size n = 20
N <- nrow(election)
set.seed(67396)
sample <- election[sort(sample(1:N, size=20)),]
# secondary information SPD in 2002
X.mean <- mean(election$SPD_02)
# forecast proportion of SPD in election of 2005
mbes(SPD_05 ~ SPD_02, data=sample, aux=X.mean, N=N, method='all')
# true value
Y.mean <- mean(election$SPD_05)
Y.mean
# Use a second predictor variable
X.mean2 <- c(mean(election$SPD_02),mean(election$GREEN_02))
# forecast proportion of SPD in election of 2005 with two predictors
mbes(SPD_05 ~ SPD_02+GREEN_02, data=sample, aux=X.mean2, N=N, method= 'regr')

## 3) money sample
data(money)
mu.X <-  mean(money$X)
x <- money$X[which(!is.na(money$y))]
y <- na.omit(money$y)
# estimation
mbes(y~x, aux=mu.X, N=13, method='all')

## 4) model based two-phase sampling with mbes() 
id <- 1:1000
x <- rep(c(1,0,1,0),times=c(10,90,70,830))
y <- rep(c(1,0,NA),times=c(15,85,900))
phase <- rep(c(2,1), times=c(100,900))
data <- data.frame(id,x,y,phase)
# mean of x out of first phase
mean.x <- mean(data$x)
mean.x
N1 <- length(data$x) 
# calculation of estimation for y 
est.y <- mbes(y~x, data=data, aux=mean.x, N=N1, method='ratio')
est.y
# correction of standard error with uncertaincy in first phase
v.y <- var(data$y, na.rm=TRUE)
se.y <- sqrt(est.y$ratio$se^2 + v.y/N1)
se.y
# corrected confidence interval
lower <- est.y$ratio$mean - qnorm(0.975)*se.y
upper <- est.y$ratio$mean + qnorm(0.975)*se.y
c(lower, upper)



