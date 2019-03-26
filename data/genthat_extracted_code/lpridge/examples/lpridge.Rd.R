library(lpridge)


### Name: lpridge
### Title: Local polynomial regression fitting with ridging
### Aliases: lpridge
### Keywords: smooth

### ** Examples

data(cars)
attach(cars)
plot(speed, dist, main = "data(cars) & lpRIDGE Regression")


myfit <- lpridge(speed,dist,bandw = 5, ridge=0)		# local polynomials
lines(myfit$x.out,myfit$est,col=2)

myridge <- lpridge(speed,dist,bandw = 5)		# local pol. ridge
lines(myridge$x.out,myridge$est,col=3)
mtext("bandw = 5")
legend(5,120, c("ridge = 0", "default ridging"), col = 2:3, lty = 1)
detach()



