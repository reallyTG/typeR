library(spaMM)


### Name: spaMM
### Title: Inference in mixed models, in particular spatial GLMMs
### Aliases: spaMM spaMM-package
### Keywords: package spatial

### ** Examples

## Fit a Poisson GLMM with adjacency (CAR) correlation model
# see ?adjacency for how to fit efficiently such model models 
data("scotlip") ## loads 'scotlip' data frame, but also 'Nmatrix'
HLCor(cases~I(prop.ag/10) +adjacency(1|gridcode)+offset(log(expec)),
          adjMatrix=Nmatrix,family=poisson(),data=scotlip) 


if (spaMM.getOption("example_maxtime")>2.1) {          
 ## Adding a Gamma random effect to fit a negative-binomial response:
 HLCor(cases~I(prop.ag/10) +(1|gridcode)+adjacency(1|gridcode)
                +offset(log(expec)),
          data=scotlip,family=poisson(),rand.family=list(Gamma(log),gaussian()),
          adjMatrix=Nmatrix)
}

 
## Not run: 
##D  ## fit non-spatial crossed random effects with distinct families
##D  data("salamander")
##D  HLfit(cbind(Mate,1-Mate)~1+(1|Female)+(1|Male),family=binomial(),
##D         rand.family=list(gaussian(),Beta(logit)),data=salamander,HLmethod="ML")
## End(Not run)

 ## Nested effects
 
## Not run: 
##D  # lmer syntax allowing several degrees of nesting
##D  HLfit(cbind(Mate,1-Mate)~1+(1|Female/Male),
##D        family=binomial(),rand.family=Beta(logit),data=salamander,HLmethod="ML")
##D  # [ also allowed is cbind(Mate,1-Mate)~1+(1|Female)+(1|Male %in% Female) ]
## End(Not run)

## fit a non-spatial, Gamma GLMM:
data("wafers")
HLfit(y ~X1*X3+X2*X3+I(X2^2)+(1|batch),family=Gamma(log),
          data=wafers)

## Same with fixed-effects predictor for residual variance 
## ( = structured-dispersion model):
HLfit(y ~X1*X3+X2*X3+I(X2^2)+(1|batch),family=Gamma(log),
          resid.model = ~ X3+I(X3^2) ,data=wafers)

## Random-slope model (mind the output!)        
if (spaMM.getOption("example_maxtime")>1) {          
  HLfit(y~X1+(X2|batch),data=wafers)
}

## fit a GLM (not mixed) with structured dispersion:
HLfit( y ~X1+X2+X1*X3+X2*X3+I(X2^2),family=Gamma(log),
      resid.model = ~ X3+I(X3^2) ,data=wafers)

## Fit of binary data using PQL/L. See ?arabidopsis
## Not run: 
##D data("arabidopsis")
##D HLCor(cbind(pos1046738,1-pos1046738)~seasonal+Matern(1|LAT+LONG),
##D                    ranPars=list(rho=0.129,lambda=4.28,nu=0.291),
##D                    family=binomial(),HLmethod="PQL/L",data=arabidopsis)
## End(Not run)



