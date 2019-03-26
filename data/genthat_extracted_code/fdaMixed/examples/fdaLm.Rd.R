library(fdaMixed)


### Name: fdaLm
### Title: Linear mixed-effects model for functional data
### Aliases: fdaLm
### Keywords: model inference

### ** Examples

# ---------------------
# Using a fixed effect
# ---------------------
x <- seq(0,2*pi,length.out=200)
y.true <- sin(x)+x
y.obs <- y.true + rnorm(200)
est0 <- fdaLm(y.obs~0,Fright="open",right=2*pi)
est1 <- fdaLm(y.obs~0+x,Fright="open",right=2*pi)
plot(x,y.obs,main="Estimating the sum of a line and a curve")
lines(x,y.true,lty=2)
lines(x,est0$xBLUP[,1,1],col=2)
lines(x,est1$betaHat*x+est1$xBLUP[,1,1],col=3)
legend("topleft",c("True curve","Smooth","Line + smooth"),col=1:3,lty=c(2,1,1))

# --------------------------
# Including a random effect
# --------------------------
# Build data frame
test.frame <- data.frame(y=rnorm(50),sample=factor(rep(1:5,each=10)),
                         x=rep(0:9,times=5),
                         f=factor(rnorm(50) < 0,labels=c("a","b")),
                         j=factor(rnorm(50) < 0,labels=c("A","B")))
test.frame$y <- test.frame$y + 2 +
    3*(test.frame$f=="a")*test.frame$x + 5*(test.frame$f=="b")*test.frame$x +
(-10)*(test.frame$j=="A") + 10*(test.frame$j=="B")
# This is the model 'y|sample ~ f:x|j' with intercept=2, slopes (3,5),
# and random effects (-10,10)
est <- fdaLm(y|sample ~ f:x|0+j,data=test.frame)
print(est)



