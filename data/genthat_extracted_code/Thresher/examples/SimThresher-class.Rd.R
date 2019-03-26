library(Thresher)


### Name: SimThresher-class
### Title: Class '"SimThresher"'
### Aliases: SimThresher-class SimThresher image,SimThresher-method
###   makeFigures,SimThresher-method
### Keywords: classes

### ** Examples

set.seed(250264)
rho <- 0.5
nProtein <- 16
splinter <- sample((nProtein/2) + (-3:3), 1)
sigma1 <- matrix(rho, ncol=nProtein, nrow=nProtein)
diag(sigma1) <- 1
st <- SimThresher(sigma1, nSample=300)
image(st, col=redgreen(64), zlim=c(-1,1))
screeplot(st, col='pink', lcol='red')
plot(st)
scatter(st)
heat(st)



