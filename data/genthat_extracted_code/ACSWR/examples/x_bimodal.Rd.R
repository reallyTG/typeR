library(ACSWR)


### Name: x_bimodal
### Title: Understanding kernel smoothing through a simulated dataset
### Aliases: x_bimodal
### Keywords: kernel smoothing

### ** Examples

data(x_bimodal)
h <- 0.5; n <- length(x_bimodal)
dens_unif <- NULL; dens_triangle <- NULL; dens_epanechnikov <- NULL
dens_biweight <- NULL; dens_triweight <- NULL; dens_gaussian <- NULL
for(i in 1:n)  {
  u <- (x_bimodal[i]-x_bimodal)/h
  xlogical <- (u>-1 & u <= 1)
  dens_unif[i] <- (1/(n*h))*(sum(xlogical)/2)
  dens_triangle[i] <- (1/(n*h))*(sum(xlogical*(1-abs(u))))
  dens_epanechnikov[i] <- (1/(n*h))*(sum(3*xlogical*(1-u^2)/4))
  dens_biweight[i] <- (1/(n*h))*(15*sum(xlogical*(1-u^2)^2/16))
  dens_triweight[i] <- (1/(n*h))*(35*sum(xlogical*(1-u^2)^3/32))
  dens_gaussian[i] <- (1/(n*h))*(sum(exp(-u^2/2)/sqrt(2*pi)))
}
plot(x_bimodal,dens_unif,"l",ylim=c(0,.25),xlim=c(-5,7),xlab="x",
     ylab="Density",main="B: Applying Kernel Smoothing")
points(x_bimodal,dens_triangle,"l",col="red")
points(x_bimodal,dens_epanechnikov,"l",col="green")
points(x_bimodal,dens_biweight,"l",col="blue")
points(x_bimodal,dens_triweight,"l",col="yellow")
points(x_bimodal,dens_gaussian,"l",col="orange")
legend(4,.23,legend=c("rectangular","triangular","epanechnikov","biweight",
                      "gaussian"),col=c("black","red","green","blue","orange"),lty=1)



