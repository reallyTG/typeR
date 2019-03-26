library(LaplaceDeconv)


### Name: LaguerreLaplaceConvolution
### Title: function LaguerreLaplaceConvolution
### Aliases: LaguerreLaplaceConvolution

### ** Examples

## Not run: 
##D 
##D  library(LaplaceDeconv)
##D  a = 1/2
##D  t = seq(0,10,l=100)
##D  g = exp(-5*t)
##D  f.coef = c(1,0.25,0.1)
##D  # compute the Laplace convolution from g, kernel computed at times t, and the function described by
##D  # its decomposition in Laguerre function basis with scale a
##D  fg = LaguerreLaplaceConvolution(t,g,f.coef,a)
##D  matplot(t,cbind(MakeLaguerreMatrix(a,3)(t)%*%f.coef,g,fg),lty=1,type='l',ylab='')
##D  legend('topright',lty=1,legend=c('f','g','fxg'),col=1:3)
##D  
## End(Not run)



