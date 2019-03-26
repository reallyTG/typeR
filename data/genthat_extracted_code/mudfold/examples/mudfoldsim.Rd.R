library(mudfold)


### Name: mudfoldsim
### Title: Function for constructing artificial item response data
###   generated under an unfolding response process. Unfolding processes
###   model the proximity (distance) between person and item parameters.
### Aliases: mudfoldsim

### ** Examples

## Not run: 
##D ## Simulate 5 different scenarios 
##D 
##D n.seed <- 10
##D 
##D sim1 <- mudfoldsim(N=6, n=100, gamma1=5, gamma2=-10, zeros=FALSE,seed=n.seed)
##D sim2 <- mudfoldsim(N=10,n=1000,gamma1=10,gamma2=-100,zeros=FALSE,seed=n.seed)
##D sim3 <- mudfoldsim(N=15,n=2000,gamma1=50,gamma2=-100,zeros=FALSE,seed=n.seed)
##D sim4 <- mudfoldsim(N=30,n=2000,gamma1=50,gamma2=-100,zeros=FALSE,seed=n.seed)
##D sim5 <- mudfoldsim(N=50,n=2000,gamma1=50,gamma2=-100,zeros=FALSE,seed=n.seed)
##D 
##D 
##D dat1 <- sim1$dat
##D dat2 <- sim2$dat
##D dat3 <- sim3$dat
##D dat4 <- sim4$dat
##D dat5 <- sim5$dat
##D 
##D fit1 <- mudfold(dat1)
##D fit1
##D fit2 <- mudfold(dat2)
##D fit2
##D fit3 <- mudfold(dat3)
##D fit3
##D fit4 <- mudfold(dat4)
##D fit4
##D fit5 <- mudfold(dat5)
##D fit5
## End(Not run)



