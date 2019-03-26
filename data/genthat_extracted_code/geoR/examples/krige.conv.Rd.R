library(geoR)


### Name: krige.conv
### Title: Spatial Prediction - Conventional Kriging
### Aliases: krige.conv krige.control
### Keywords: spatial

### ** Examples

## Not run: 
##D # Defining a prediction grid
##D loci <- expand.grid(seq(0,1,l=21), seq(0,1,l=21))
##D # predicting by ordinary kriging
##D kc <- krige.conv(s100, loc=loci,
##D                  krige=krige.control(cov.pars=c(1, .25)))
##D # mapping point estimates and variances
##D par.ori <- par(no.readonly = TRUE)
##D par(mfrow=c(1,2), mar=c(3.5,3.5,1,0), mgp=c(1.5,.5,0))
##D image(kc, main="kriging estimates")
##D image(kc, val=sqrt(kc$krige.var), main="kriging std. errors")
##D # Now setting the output to simulate from the predictive
##D # (obtaining conditional simulations),
##D # and to compute quantile and probability estimators
##D s.out <- output.control(n.predictive = 1000, quant=0.9, thres=2)
##D set.seed(123)
##D kc <- krige.conv(s100, loc = loci,
##D          krige = krige.control(cov.pars = c(1,.25)),
##D          output = s.out)
##D par(mfrow=c(2,2))
##D image(kc, val=kc$simul[,1], main="a cond. simul.")
##D image(kc, val=kc$simul[,1], main="another cond. simul.")
##D image(kc, val=(1 - kc$prob), main="Map of P(Y > 2)")
##D image(kc, val=kc$quant, main="Map of y s.t. P(Y < y) = 0.9")
##D par(par.ori)
## End(Not run)



