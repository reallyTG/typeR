library(spaMM)


### Name: phiHGLM
### Title: Fitting random effects in the residual dispersion model
### Aliases: phiHGLM

### ** Examples

if (spaMM.getOption("example_maxtime")>4.9) {
 data("crack") # crack data, Lee et al. 2006 chapter 11 etc
 hlfit <- HLfit(y~crack0+(1|specimen),family=Gamma(log),
                data=crack, HLmethod="REML", 
                rand.family=inverse.Gamma(log), 
                resid.model=list(formula=~cycle+(1|specimen)) )
}



