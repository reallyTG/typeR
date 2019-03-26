library(fANCOVA)


### Name: T.L2
### Title: Test the equality of nonparametric curves or surfaces based on
###   L2 distance
### Aliases: T.L2 T.L2.default
### Keywords: nonparametric smooth test the equality

### ** Examples

## Nonparametric test the equality of multiple regression curves
## Simulate data sets

n1 <- 100
x1 <- runif(n1,min=0, max=3)
sd1 <- 0.2
e1 <- rnorm(n1,sd=sd1)
y1 <- sin(2*x1) + e1

n2 <- 100
x2 <- runif(n2, min=0, max=3)
sd2 <- 0.25
e2 <- rnorm(n2, sd=sd2)
y2 <- sin(2*x2) + 1 + e2

n3 <- 120
x3 <- runif(n3, min=0, max=3)
sd3 <- 0.25
e3 <- rnorm(n3, sd=sd3)
y3 <- sin(2*x3)  + e3

data.bind <- rbind(cbind(x1,y1,1), cbind(x2,y2,2),cbind(x3,y3,3))
data.bind <- data.frame(data.bind)
colnames(data.bind)=c('x','y','group') 


t1 <- T.L2(data.bind$x, data.bind$y, data.bind$group, degree=2)
t1
plot(t1)
plot(t1, test.statistic=FALSE)

########
## Nonparametric test the equality for regression surfaces
## Simulate data sets

n1 <- 100
x11 <- runif(n1,min=0, max=3)
x12 <- runif(n1,min=0, max=3)
sd1 <- 0.2
e1 <- rnorm(n1,sd=sd1)
y1 <- sin(2*x11) + sin(2*x12)  + e1

n2 <- 100
x21 <- runif(n2, min=0, max=3)
x22 <- runif(n2, min=0, max=3)
sd2 <- 0.25
e2 <- rnorm(n2, sd=sd2)
y2 <- sin(2*x21) + sin(2*x22) + 1 + e2

n3 <- 120
x31 <- runif(n3, min=0, max=3)
x32 <- runif(n3, min=0, max=3)
sd3 <- 0.25
e3 <- rnorm(n3, sd=sd3)
y3 <- sin(2*x31) + sin(2*x32) + e3

data.bind <- rbind(cbind(x11, x12 ,y1,1), cbind(x21, x22, y2,2),cbind(x31, x32,y3,3))
data.bind <- data.frame(data.bind)
colnames(data.bind)=c('x1','x2', 'y','group') 

T.L2(data.bind[,c(1,2)], data.bind$y, data.bind$group, degree=2)



