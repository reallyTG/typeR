library(Thresher)

# unstructured nmatrix
set.seed(9948489)
dumb <- matrix(rnorm(100*12), ncol=12)
colnames(dumb) <- paste("G", 1:12, sep='')
thresh <- Thresher(dumb)
summary(thresh@delta)
screeplot(thresh)
screeplot(thresh)
plot(thresh)
scatter(thresh)
heat(thresh)

# data matrices with structure
set.seed(250264)
rho <- 0.5
nProtein <- 16
splinter <- sample((nProtein/2) + (-3:3), 1)
sigma1 <- matrix(rho, ncol=nProtein, nrow=nProtein)
diag(sigma1) <- 1
sigma2 <- sigma1
sigma2[(1+splinter):nProtein, 1:splinter] <- 0
sigma2[1:splinter, (1+splinter):nProtein] <- 0
st <- SimThresher(sigma2, nSample=300)
image(st, col=redgreen(64), zlim=c(-1,1))
screeplot(st, col='pink', lcol='red')
plot(st)
plot(thresh, ij=3:4)
scatter(st)
heat(st)
heat(st, 3)

