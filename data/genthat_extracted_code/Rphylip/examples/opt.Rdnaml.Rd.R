library(Rphylip)


### Name: opt.Rdnaml
### Title: Parameter optimizer for Rdnaml
### Aliases: opt.Rdnaml
### Keywords: phylogenetics inference maximum likelihood DNA

### ** Examples

## Not run: 
##D data(primates)
##D fit<-opt.Rdnaml(primates,bounds=list(kappa=c(0.1,40))
##D tree<-Rdnaml(primates,kappa=fit$kappa,gamma=fit$gamma,bf=fit$bf)
## End(Not run)



