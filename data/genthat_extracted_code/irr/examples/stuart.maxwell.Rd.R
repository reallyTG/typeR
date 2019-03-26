library(irr)


### Name: stuart.maxwell.mh
### Title: Stuart-Maxwell coefficient of concordance for two raters
### Aliases: stuart.maxwell.mh
### Keywords: misc

### ** Examples

 # fake a 2xn matrix of three way classification scores
 ratings<-matrix(sample(1:3,60,TRUE), nrow=2)
 stuart.maxwell.mh(ratings)
 
 # Example used from Stuart (1955)
 data(vision)
 stuart.maxwell.mh(vision)



