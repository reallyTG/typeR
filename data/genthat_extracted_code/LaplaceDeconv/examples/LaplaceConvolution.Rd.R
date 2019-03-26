library(LaplaceDeconv)


### Name: LaplaceConvolution
### Title: function LaplaceConvolution
### Aliases: LaplaceConvolution

### ** Examples

## Not run: 
##D 
##D  library(LaplaceDeconv)
##D  t = seq(0,10,l=100)
##D  g = exp(-5*t)
##D  f = t^2*exp(-t)
##D  # compute the Laplace convolution from functions computed at times t : f and g
##D  fg = LaplaceConvolution(t,g,f)
##D  matplot(t,cbind(f,g,fg),lty=1,type='l')
##D  legend('topright',lty=1,legend=c('f','g','fxg'),col=1:3)
##D  
## End(Not run)



