library(IROmiss)


### Name: SimRCLM
### Title: Simulate Dataset for Random Coefficient Linear Models
### Aliases: SimRCLM
### Keywords: RCLM

### ** Examples

## Don't show: 
library(IROmiss)
beta<-c(1,-1,3,-1.5)
sigma <- 0.5
D <- SimRCLM(I=75, J=15, beta, sigma)
D
RCLM(I=75, J=15, D, iteration = 100, warm = 10)
## End(Don't show)
## No test: 
library(IROmiss)
beta<-c(1,2,1.5,1)
sigma <- 0.5
D <- SimRCLM(I=100, J=10, beta, sigma)
RCLM(I=100, J=10, D, iteration = 10000, warm = 1000)
## End(No test)




