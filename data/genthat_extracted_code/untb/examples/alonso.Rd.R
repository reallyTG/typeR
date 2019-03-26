library(untb)


### Name: alonso
### Title: Various functions from Alonso and McKane 2004
### Aliases: alonso.eqn6 alonso.eqn11 alonso.eqn12
### Keywords: math

### ** Examples

J <- 100
plot(1:J , alonso.eqn11(J,n=1:J,
theta=5),log="y",type="l",xlab="n",ylab=expression(S(n)),main="Eqns
11 and 12 of Alonso and McKane")
points(1:J , alonso.eqn12(J,n=1:J, theta=5),type="l",lty=2)
legend("topright",legend=c("equation 11","equation 12"),lty=1:2)



