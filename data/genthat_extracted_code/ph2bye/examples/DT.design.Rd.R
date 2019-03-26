library(ph2bye)


### Name: DT.design
### Title: The whole design with double thresholds showing futility and
###   efficacy boundary together
### Aliases: DT.design

### ** Examples

## Using vague prior Unif(0,1), sequential monitor
DT.design(type = "PostP", a=1, b=1, nmin=20, nmax=60, p0=0.4, p1=0.3, theta0 = 0.05, theta1 = 0.9)
DT.design(type = "PredP", a=1, b=1, nmin=20, nmax=60, p0=0.4, p1=0.3, theta0 = 0.05, theta1 = 0.9,
theta_t = 0.9)
## Or using Jeffery prior with Beta(0.5,0.5), multi-stage monitor when sample size is
## 10, 20, ..., 80
DT.design(type = "PostP", a=0.5, b=0.5, nmin=1, nmax=85, p0=0.3, p1=0.3, theta0 = 0.05,
theta1 = 0.9)[(1:8)*10,]
DT.design(type = "PredP", a=0.5, b=0.5, nmin=1, nmax=85, p0=0.3, p1=0.3, theta0 = 0.05,
theta1 = 0.9, theta_t = 0.9)[(1:8)*10,]



