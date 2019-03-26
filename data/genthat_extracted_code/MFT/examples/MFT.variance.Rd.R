library(MFT)


### Name: MFT.variance
### Title: MFT.variance
### Aliases: MFT.variance

### ** Examples

# Rate and variance change detection in Gamma process 
# (rate CPs at t=30 and 37.5, variance CPs at t=37.5 and 52.5) 
set.seed(51)
mu <- 0.03; sigma <- 0.01
p1 <- mu^2/sigma^2; lambda1 <- mu/sigma^2
p2 <- (mu*0.5)^2/sigma^2; lambda2 <- (mu*0.5)/sigma^2
p3 <- mu^2/(sigma*1.5)^2; lambda3 <- mu/(sigma*1.5)^2
p4 <- mu^2/(sigma*0.5)^2; lambda4 <- mu/(sigma*0.5)^2
Phi <- cumsum(c(rgamma(1000,p1,lambda1),rgamma(500,p2,lambda2),
rgamma(500,p3,lambda3),rgamma(300,p4,lambda4)))
# rcp  <- MFT.rate(Phi)$CP[,1] # MFT for the rates
rcp <- c(30,37.5) # but here we assume known rate CPs
mft <- MFT.variance(Phi,rcp=rcp) # MFT for the variances
plot(mft)




