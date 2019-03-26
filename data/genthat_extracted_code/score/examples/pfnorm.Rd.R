library(score)


### Name: pfnorm
### Title: Compares physical functional performance to normal ranges
### Aliases: pfnorm
### Keywords: fitness

### ** Examples

# Generating a random physical performance data for illustration
n <- 20
ID <- rep(1:n)
Age <- rtnorm(n, mean=75, sd=15, lower=60, upper=94)
Gender <- sample(c("F","M"),n,replace=TRUE)
NumberofSteps <- sample(rep(0:150),n,replace=TRUE)
Numberoffullstands <- sample(rep(0:20),n,replace=TRUE)
UpGo8ftmean <- rtnorm(n, mean=7.5, sd=4, lower=3, upper=30)
armcurlR_Lmean <- rnorm(n, mean=14, sd=4)


samplePerf <- data.frame(ID,Age,Gender,
                         NumberofSteps,Numberoffullstands,
                         UpGo8ftmean,armcurlR_Lmean)
                         
# Now comparing the physical performance test to the norm
normCat <- pfnorm(samplePerf)




