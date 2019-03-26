library(gamm4.test)


### Name: gamm4.grptest
### Title: Test the equality of nonlinear curves and surface estimations by
###   semiparametric methods with correlated data
### Aliases: gamm4.grptest

### ** Examples

## No test: 
#Test the equality of three nonlinear curves
m1 <- 120 #number of subjects in group 1
m2 <- 100 #number of subjects in group 2
m3 <- 110 #number of subjects in group 3
n1 <- 3 #number of repeated measurements for each subject in group 1
n2 <- 4 #number of repeated measurements for each subject in group 2
n3 <- 2 #number of repeated measurements for each subject in group 3
sigma1 <- 0.3
sigma2 <- 0.2
sigma3 <- 0.2
sigma.noise1 <- sigma.noise2 <- sigma.noise3 <- 0.1
f1 <- function(u) sin(2*pi*u)
f2 <- f3 <- function(u) sin(2*pi*u)+u/3
N1 <- m1*n1
N2 <- m2*n2
N3 <- m3*n3

x11 <- runif(N1,0,1)
b1i <- rnorm(m1,0,sigma1)
b1 <- rep(b1i, each=n1)
id1 <- rep(1:m1, each=n1)
y1 <- f1(x11) + b1 + rnorm(N1, 0, sigma.noise1)

x21 <- runif(N2,0,1)
b2i <- rnorm(m2,0,sigma2)
b2 <- rep(b2i,each=n2)
id2 <- rep((m1+1):(m1+m2),each=n2)
y2 <- f2(x21) + b2 + rnorm(N2,0,sigma.noise2)

x31 <- runif(N3,0,1)
b3i <- rnorm(m3,0,sigma3)
b3 <- rep(b3i,each=n3)
id3 <- rep((m1+m2+1):(m1+m2+m3),each=n3)
y3 <- f3(x31) + b3 + rnorm(N3,0,sigma.noise2)

dat <- data.frame(rbind(cbind(id1, x11,y1,1), cbind(id2, x21, y2,2), cbind(id3, x31, y3,3)))
colnames(dat)=c('id','x', 'y','grp')
testout <- gamm4.grptest(formula=y~s(x,k=6,bs="cr"), test=~grp,
                        random=~(1|id), data=dat, N.boot=200, m=225, parallel = TRUE)
testout
plot(testout)

dat0 <- data.frame(rbind(cbind(id3, x31, y3, 3), cbind(id2, x21, y2, 2)))
colnames(dat0)=c('id', 'x', 'y', 'grp')
testout0 <- gamm4.grptest(formula=y~s(x,k=6,bs="cr"), test=~grp,
       random=~(1|id), data=dat0, N.boot=200, m=225, parallel= TRUE)
testout0$p.value
plot(testout0, test.statistic = TRUE)

########
## Semiparametric test the equality for regression surfaces with longitudinal data
## Simulate data sets
f1 <- function(u,v) 2*u^2+3*v^2
f2 <- function(u,v) 2*u^2+3*v^2+sin(2*pi*u)

m1 <- 100 #number of subjects in group 1
n1 <- 4 #number of repeated measurements for each subject in group 1
m2 <- 120 #number of subjects in group 2
n2 <- 3 #number of repeated measurements for each subject in group 2
N1 <- m1*n1
N2 <- m2*n2
sigma1 <- 0.2
sigma2 <- 0.15
sigma.noise1 <- 0.04
sigma.noise2 <- 0.05
x11 <- runif(N1,0,1)
x12 <- runif(N1,0,1)
b1i <- rnorm(m1,0,sigma1)
b1 <- rep(b1i,each=n1)
id1 <- rep(1:m1,each=n1)
y1 <- f1(x11,x12) + b1 + rnorm(N1,0, sigma.noise1)

x21 <- runif(N2,0,1)
x22 <- runif(N2,0,1)
b2i <- rnorm(m2,0,sigma2)
b2 <- rep(b2i,each=n2)
id2 <- rep((m1+1):(m1+m2),each=n2)
y2 <- f2(x21,x22) + b2 + rnorm(N2,0,sigma.noise2)

y3 <- f1(x21,x22) + b2 + rnorm(N2,0,sigma.noise2)

dat <- data.frame(rbind(cbind(id1, x11, x12,y1,1), cbind(id2, x21, x22, y2,2)))
colnames(dat)=c('id','x1','x2', 'y','grp')

test.spline1 <- gamm4.grptest(formula=y~t2(x1,x2), test=~grp,
               random=~(1|id), data=dat, N.boot=200, m=225, parallel=TRUE)
plot(test.spline1)
plot(test.spline1, type="plotly.persp")
plot(test.spline1, type="plotly.persp", data.pts=TRUE)

dat0 <- data.frame(rbind(cbind(id1, x11, x12 , y1, 1), cbind(id2, x21, x22, y3, 2)))
colnames(dat0)=c('id','x1','x2', 'y','grp')

test.spline0 <- gamm4.grptest(y~t2(x1,x2), test=~grp,
               random=~(1|id), data=dat0, N.boot=200, m=225, parallel=TRUE)
test.spline0
plot(test.spline0, test.statistic = FALSE)
plot(test.spline0)
plot(test.spline0, type="plotly.persp")

########
## Data analyses with internal "outchild" dataset

data("outchild")
outchild1016 <- outchild[(outchild$age<=16 & outchild$age>10),]
child.repw <- outchild1016[(outchild1016$RACE==1),]
child.reptest1 <- gamm4.grptest(HEIGHT~s(age), random=~(1|SID), 
                               test=~SEX, data=child.repw, parallel = TRUE)
child.reptest1
plot(child.reptest1)
plot(child.reptest1,test.statistic = FALSE)

child.reptest2 <- gamm4.grptest(WEIGHT~t2(age,HEIGHT), random=~(1|SID), 
                              test=~SEX, data = child.repw, parallel = TRUE)
plot(child.reptest2,type="plotly.persp")
plot(child.reptest2,type="contour")
## End(No test)



