library(RTDE)


### Name: fitRTDE
### Title: Fitting a Tail Dependence model with a Robust Estimator
### Aliases: fitRTDE summary.fitRTDE print.fitRTDE plot.fitRTDE
### Keywords: distribution

### ** Examples


#####
# (1) simulation 

omega <- 1/2
m <- 48
n <- 100
obs <- cbind(rupareto(n), rupareto(n)) + rupareto(n)

#function of m
system.time(
x <- fitRTDE(obs, nbpoint=m:(n-m), 0, 1/2)
)
x
summary(x)
plot(x, which=1)
plot(x, which=2)





