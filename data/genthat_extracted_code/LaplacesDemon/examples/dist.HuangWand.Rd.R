library(LaplacesDemon)


### Name: dist.HuangWand
### Title: Huang-Wand Distribution
### Aliases: dhuangwand dhuangwandc rhuangwand rhuangwandc
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
dhuangwand(diag(3), nu=2, a=runif(3), A=rep(1e6,3), log=TRUE)
rhuangwand(nu=2, A=rep(1e6, 3)) #Missing a
rhuangwand(nu=2, a=runif(3)) #Missing A



