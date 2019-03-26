library(qqtest)


### Name: qkay
### Title: 'qkay' The K distribution quantile function
### Aliases: qkay

### ** Examples


p <- ppoints(30)
# Get the quantiles for these points
q5 <- qkay(p, 5)
plot(p, q5, main="Quantile plot of K(20)", ylim=c(0,max(q5)))
# Add quantiles from another K
points(p, qkay(p, 20), pch=19)

# 
# Do these EXACT quantiles from a K(5) look like they might  
# have been generated from K(20)?
qqtest(q5, dist="kay",df=20)

# How about compared to normal?
qqnorm(q5)
qqtest(q5)
# for this many degrees of freedom it looks a lot like  
# a gaussian (normal) distribution

# And should look really good compared to the true distribution
qqtest(q5, dist="kay", df=5)
#
#
# But not so much like it came from a K on 1 degree of freedom
qqtest(q5, dist="kay",df=1)
	



