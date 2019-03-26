library(matchingMarkets)


### Name: stabit2
### Title: Matching model and selection correction for college admissions
### Aliases: stabit2
### Keywords: regression

### ** Examples

## Not run: 
##D ## --- SIMULATED EXAMPLE ---
##D 
##D ## 1. Simulate two-sided matching data for 20 markets (m=20) with 100 students
##D ##    (nStudents=100) per market and 20 colleges with quotas of 5 students, each
##D ##    (nSlots=rep(5,20)). True parameters in selection and outcome equations are 
##D ##    all equal to 1.
##D 
##D xdata <- stabsim2(m=20, nStudents=100, nSlots=rep(5,20), verbose=FALSE,
##D   colleges = "c1", students = "s1",
##D   outcome = ~ c1:s1 + eta + nu,
##D   selection = ~ -1 + c1:s1 + eta
##D )
##D head(xdata$OUT)
##D 
##D 
##D ## 2. Correction for sorting bias when match valuations V are observed
##D 
##D ## 2-a. Bias from sorting
##D  lm1 <- lm(y ~ c1:s1, data=xdata$OUT)
##D  summary(lm1)
##D 
##D ## 2-b. Cause of the bias
##D  with(xdata$OUT, cor(c1*s1, eta))
##D 
##D ## 2-c. Correction for sorting bias
##D  lm2a <- lm(V ~ -1 + c1:s1, data=xdata$SEL); summary(lm2a)
##D  etahat <- lm2a$residuals[xdata$SEL$D==1]
##D  
##D  lm2b <- lm(y ~ c1:s1 + etahat, data=xdata$OUT)
##D  summary(lm2b)
##D 
##D 
##D ## 3. Correction for sorting bias when match valuations V are unobserved
##D 
##D ## 3-a. Run Gibbs sampler (when SEL is given)
##D  fit2 <- stabit2(OUT = xdata$OUT, 
##D            SEL = xdata$SEL,
##D            outcome = y ~ c1:s1, 
##D            selection = ~ -1 + c1:s1,
##D            niter=1000
##D  )
##D 
##D ## 3-b. Alternatively: Run Gibbs sampler (when SEL is not given)
##D  fit2 <- stabit2(OUT = xdata$OUT, 
##D            colleges = "c1",
##D            students = "s1",
##D            outcome = y ~ c1:s1, 
##D            selection = ~ -1 + c1:s1,
##D            niter=1000
##D  )
##D 
##D 
##D ## 4. Implemented methods
##D 
##D ## 4-a. Get coefficients
##D  fit2
##D  
##D ## 4-b. Coefficient table
##D  summary(fit2)
##D  
##D ## 4-c. Get marginal effects
##D  summary(fit2, mfx=TRUE)
##D  
##D ## 4-d. Also try the following functions
##D  #coef(fit2)
##D  #fitted(fit2)
##D  #residuals(fit2)
##D  #predict(fit2, newdata=NULL)
##D 
##D    
##D ## 5. Plot MCMC draws for coefficients
##D  plot(fit2)
## End(Not run)



