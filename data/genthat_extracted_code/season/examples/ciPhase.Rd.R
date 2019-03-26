library(season)


### Name: ciPhase
### Title: Mean and Confidence Interval for Circular Phase
### Aliases: ciPhase

### ** Examples
## No test: 
theta = rnorm(n=2000, mean=0, sd=pi/50) # 2000 normal samples, centred on zero
hist(theta, breaks=seq(-pi/8, pi/8, pi/30))
ciPhase(theta)
## End(No test)



