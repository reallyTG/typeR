library(untb)


### Name: vallade
### Title: Various functions from Vallade and Houchmandzadeh
### Aliases: vallade Vallade vallade.eqn5 vallade.eqn7 vallade.eqn12
###   vallade.eqn14 vallade.eqn16 vallade.eqn17
### Keywords: math

### ** Examples

# A nice check:
JM <- 100
k <- 1:JM
sum(k*vallade.eqn5(JM,theta=5,k))  # should be JM=100 exactly.



# Now, a replication of Figure 3:
  omega <- seq(from=0.01, to=0.99,len=100)
  f <- function(omega,mu){
    vallade.eqn17(mu,theta=5, omega=omega)
  }
  plot(omega,
  omega*5,type="n",xlim=c(0,1),ylim=c(0,5),
        xlab=expression(omega),
        ylab=expression(omega*g[C](omega)),
        main="Figure 3 of Vallade and Houchmandzadeh")
  points(omega,omega*sapply(omega,f,mu=0.5),type="l")
  points(omega,omega*sapply(omega,f,mu=1),type="l")
  points(omega,omega*sapply(omega,f,mu=2),type="l")
  points(omega,omega*sapply(omega,f,mu=4),type="l")
  points(omega,omega*sapply(omega,f,mu=8),type="l")
  points(omega,omega*sapply(omega,f,mu=16),type="l")
  points(omega,omega*sapply(omega,f,mu=Inf),type="l")




# Now a discrete version of Figure 3 using equation 14:
J <- 100
omega <- (1:J)/J

f <- function(n,mu){
   m <- mu/(J-1+mu)
   vallade.eqn14(J=J, theta=5, m=m, n=n)
 }
plot(omega,omega*0.03,type="n",main="Discrete version of Figure 3 using
   eqn 14")
points(omega,omega*sapply(1:J,f,mu=16))
points(omega,omega*sapply(1:J,f,mu=8))
points(omega,omega*sapply(1:J,f,mu=4))
points(omega,omega*sapply(1:J,f,mu=2))
points(omega,omega*sapply(1:J,f,mu=1))
points(omega,omega*sapply(1:J,f,mu=0.5))




