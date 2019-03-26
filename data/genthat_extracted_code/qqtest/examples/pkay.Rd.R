library(qqtest)


### Name: pkay
### Title: 'pkay' The cumulative distribution function K distribution
### Aliases: pkay

### ** Examples


pkay(1, 20)
q <- seq(0.01, 1.8, 0.01)
#
# Plot the cdf for K(5)
u <- pkay(q,5)
plot(q, u, type="l",  
     xlab="q", ylab="cumulative probability", 
     xlim=range(q), ylim=c(0,1),  
     main="K cdf")
#
# Add some other K cdfs
lines(q, pkay(q,10), lty=2)
lines(q, pkay(q,20), lty=3)
lines(q, pkay(q,30), lty=4)
legend("topleft",  
       legend=c("df = 5", "df = 10", "df = 20", "df = 30"),  
       lty=c(1,2,3,4),  
       title="degrees of freedom",  
       cex=0.75, bty="n")




