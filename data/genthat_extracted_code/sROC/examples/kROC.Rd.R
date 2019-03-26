library(sROC)


### Name: kROC
### Title: Kernel Estimation for ROC Curves
### Aliases: kROC
### Keywords: nonparametric smooth

### ** Examples


## --------------------
set.seed(100)
n <- 200
x <- rgamma(n,2,1)
y <- rnorm(n)

xy.ROC <- kROC(x,y, bw.x="pi_sj",bw.y="pi_sj")
xy.ROC

plot(xy.ROC)




