library(gamm4.test)


### Name: gam.grptest
### Title: Test the equality of nonlinear curves and surface estimations by
###   semiparametric method
### Aliases: gam.grptest

### ** Examples

## Don't show: 
n1 <- 30
x1 <- runif(n1,min=0, max=3)
sd1 <- 0.2
e1 <- rnorm(n1,sd=sd1)
y1 <- sin(2*x1) + cos(2*x1) + e1

n2 <- 30
x2 <- runif(n2, min=0, max=3)
sd2 <- 0.25
e2 <- rnorm(n2, sd=sd2)
y2 <- sin(2*x2) + cos(2*x2) + x2 + e2

data.bind <- rbind(cbind(x1,y1,1), cbind(x2,y2,2))
data.bind <- data.frame(data.bind)
colnames(data.bind)=c('x','y','group')

t1 <- gam.grptest(y~s(x,bs="cr"), test=~group, data=data.bind, parallel=FALSE)
t1
plot(t1)
## End(Don't show)

## No test: 
n1 <- 200
x1 <- runif(n1,min=0, max=3)
sd1 <- 0.2
e1 <- rnorm(n1,sd=sd1)
y1 <- sin(2*x1) + cos(2*x1) + e1

n2 <- 120
x2 <- runif(n2, min=0, max=3)
sd2 <- 0.25
e2 <- rnorm(n2, sd=sd2)
y2 <- sin(2*x2) + cos(2*x2) + x2 + e2

data.bind <- rbind(cbind(x1,y1,1), cbind(x2,y2,2))
data.bind <- data.frame(data.bind)
colnames(data.bind)=c('x','y','group')

t1 <- gam.grptest(y~s(x,bs="cr"), test=~group, data=data.bind, parallel=FALSE)
t1
plot(t1)

########
## Semiparametric test the equality for regression surfaces
## Simulate data sets

n1 <- 500
x11 <- runif(n1,min=0, max=3)
x12 <- runif(n1,min=0, max=3)
sd1 <- 0.2
e1 <- rnorm(n1,sd=sd1)
y1 <- 2*x11^2 + 3*x12^2  + e1

n2 <- 420
x21 <- runif(n2, min=0, max=3)
x22 <- runif(n2, min=0, max=3)
sd2 <- 0.25
e2 <- rnorm(n2, sd=sd2)
y2 <- 2*x21^2 + 3*x22^2 + 6*sin(2*pi*x21) + e2

n3 <- 550
x31 <- runif(n3,min=0, max=3)
x32 <- runif(n3,min=0, max=3)
sd3 <- 0.2
e3 <- rnorm(n3,sd=sd1)
y3 <- 2*x31^2 + 3*x32^2  + e3

data.bind <- rbind(cbind(x11, x12 ,y1,1), cbind(x21, x22, y2,2), cbind(x31, x32, y3,3))
data.bind <- data.frame(data.bind)
colnames(data.bind)=c('x1','x2', 'y','group')

tspl <- gam.grptest(y~s(x1,x2), test=~group, data=data.bind, N.boot=200, m=225, parallel=FALSE)
tspl$p.value #p-value
plot(tspl, test.statistic = TRUE)
plot(tspl, type="contour")
plot(tspl, type="persp")
plot(tspl, type="plotly.persp")
plot(tspl, type="plotly.persp",data.pts=TRUE)

########
## Data analyses with internal "outchild" dataset

data("outchild")
child<- outchild[order(outchild$SID,outchild$age),]
bs <- aggregate(.~SID, child, FUN=head, 1)

childcur <- bs[,c("SEX","WEIGHT","age")]
test.grpsex1 <- gam.grptest(WEIGHT~s(age), test=~SEX, data=childcur)
test.grpsex1
plot(test.grpsex1)
plot(test.grpsex1,test.statistic=TRUE)

childsurf <- bs[,c("SEX","HEIGHT","WEIGHT","age")]
test.grpsex2 <- gam.grptest(WEIGHT~s(HEIGHT,age), test=~SEX, data=childsurf)
test.grpsex2
plot(test.grpsex2)
plot(test.grpsex2, type="plotly.persp")
plot(test.grpsex2, type="plotly.persp",data.pts=TRUE)
## End(No test)



