library(refund)


### Name: fbps
### Title: Sandwich smoother for matrix data
### Aliases: fbps

### ** Examples


##########################
#### True function   #####
##########################
n1 <- 60
n2 <- 80
x <- (1:n1)/n1-1/2/n1
z <- (1:n2)/n2-1/2/n2
MY <- array(0,c(length(x),length(z)))

sigx <- .3
sigz <- .4
for(i in 1:length(x))
for(j in 1:length(z))
{
#MY[i,j] <- .75/(pi*sigx*sigz) *exp(-(x[i]-.2)^2/sigx^2-(z[j]-.3)^2/sigz^2)
#MY[i,j] <- MY[i,j] + .45/(pi*sigx*sigz) *exp(-(x[i]-.7)^2/sigx^2-(z[j]-.8)^2/sigz^2)
MY[i,j] = sin(2*pi*(x[i]-.5)^3)*cos(4*pi*z[j])
}
##########################
#### Observed data   #####
##########################
sigma <- 1
Y <- MY + sigma*rnorm(n1*n2,0,1)
##########################
####   Estimation    #####
##########################

est <- fbps(Y,list(x=x,z=z))
mse <- mean((est$Yhat-MY)^2)
cat("mse of fbps is",mse,"\n")
cat("The smoothing parameters are:",est$lambda,"\n")
########################################################################
########## Compare the estimated surface with the true surface #########
########################################################################

par(mfrow=c(1,2))
persp(x,z,MY,zlab="f(x,z)",zlim=c(-1,2.5), phi=30,theta=45,expand=0.8,r=4,
      col="blue",main="True surface")
persp(x,z,est$Yhat,zlab="f(x,z)",zlim=c(-1,2.5),phi=30,theta=45,
      expand=0.8,r=4,col="red",main="Estimated surface")



