library(fANCOVA)


### Name: loess.ancova
### Title: Fit a semiparametric ANCOVA model with a local polynomial
###   smoother
### Aliases: loess.ancova
### Keywords: semiparametric nonparametric smoothing

### ** Examples

## Fit semiparametric ANCOVA model
set.seed(555)
n1 <- 80
x1 <- runif(n1,min=0, max=3)
sd1 <- 0.3
e1 <- rnorm(n1,sd=sd1)
y1 <- 3*cos(pi*x1/2)  + 6 + e1

n2 <- 75
x2 <- runif(n2, min=0, max=3)
sd2 <- 0.2
e2 <- rnorm(n2, sd=sd2)
y2 <- 3*cos(pi*x2/2) + 3 + e2

n3 <- 90
x3 <- runif(n3, min=0, max=3)
sd3 <- 0.3
e3 <- rnorm(n3, sd=sd3)
y3 <- 3*cos(pi*x3/2)  + e3

data.bind <- rbind(cbind(x1,y1,1), cbind(x2,y2,2),cbind(x3,y3,3))
data.bind <- data.frame(data.bind)
colnames(data.bind)=c('x','y','group') 

x <- data.bind[,1]
y <- data.bind[,2]
group <- data.bind[,3]

loess.ancova(x,y,group, plot=TRUE, data.points=TRUE)

## Fit semiparametric ANCOVA model when the predictor is two-dimensional
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
y3 <- sin(2*x31) + sin(2*x32) + 3 + e3

data.bind <- rbind(cbind(x11, x12 ,y1,1), cbind(x21, x22, y2,2),cbind(x31, x32,y3,3))
data.bind <- data.frame(data.bind)
colnames(data.bind)=c('x1','x2', 'y','group') 

loess.ancova(data.bind[,c(1,2)], data.bind$y, data.bind$group, plot=TRUE)



