library(ashr)


### Name: ash
### Title: Adaptive Shrinkage
### Aliases: ash ash.workhorse

### ** Examples


beta = c(rep(0,100),rnorm(100))
sebetahat = abs(rnorm(200,0,1))
betahat = rnorm(200,beta,sebetahat)
beta.ash = ash(betahat, sebetahat)
names(beta.ash)
head(beta.ash$result) # the main dataframe of results
head(get_pm(beta.ash)) # get_pm returns posterior mean
head(get_lfsr(beta.ash)) # get_lfsr returns the local false sign rate
graphics::plot(betahat,get_pm(beta.ash),xlim=c(-4,4),ylim=c(-4,4))

## Not run: 
##D # Why is this example included here? -Peter
##D CIMatrix=ashci(beta.ash,level=0.95)
##D print(CIMatrix)
## End(Not run)

# Illustrating the non-zero mode feature.
betahat=betahat+5
beta.ash = ash(betahat, sebetahat)
graphics::plot(betahat,get_pm(beta.ash))
betan.ash=ash(betahat, sebetahat,mode=5)
graphics::plot(betahat,get_pm(betan.ash))
summary(betan.ash)

# Running ash with different error models
beta.ash1 = ash(betahat, sebetahat, lik = lik_normal())
beta.ash2 = ash(betahat, sebetahat, lik = lik_t(df=4))

e = rnorm(100)+log(rf(100,df1=10,df2=10)) # simulated data with log(F) error
e.ash = ash(e,1,lik=lik_logF(df1=10,df2=10))

# Specifying the output
beta.ash = ash(betahat, sebetahat, output = c("fitted_g","logLR","lfsr"))

#Running ash with a pre-specified g, rather than estimating it
beta = c(rep(0,100),rnorm(100))
sebetahat = abs(rnorm(200,0,1))
betahat = rnorm(200,beta,sebetahat)
true_g = normalmix(c(0.5,0.5),c(0,0),c(0,1)) # define true g
## Passing this g into ash causes it to i) take the sd and the means
## for each component from this g, and ii) initialize pi to the value
## from this g.
beta.ash = ash(betahat, sebetahat,g=true_g,fixg=TRUE)

# running with weights
beta.ash = ash(betahat, sebetahat, optmethod="w_mixEM",
               weights = c(rep(0.5,100),rep(1,100)))

# Small example in which the interior-point method (implemented in
# MOSEK) yields negative mixture weights. These mixture weights are
# automatically set to zero and the weights are re-normalized. The
# EM algorithm does not suffer from this problem.
set.seed(1)
betahat <- c(8.115,9.027,9.289,10.097,9.463)
sebeta  <- c(0.6157,0.4129,0.3197,0.3920,0.5496)
fit.em  <- ash(betahat,sebeta,mixcompdist = "normal",optmethod = "mixEM")
fit.ip  <- ash(betahat,sebeta,mixcompdist = "normal",optmethod = "mixIP")



