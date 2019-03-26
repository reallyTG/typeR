library(qrLMM)


### Name: QRLMM
### Title: Quantile Regression for Linear Mixed-Effects Models
### Aliases: QRLMM
### Keywords: SAEM quantile quantile regression linear mixed models ALD

### ** Examples

#Using the Orthodontic distance growth data

data(Orthodont)
attach(Orthodont)

y  = distance #response
x  = cbind(1,c(rep(0,64),rep(1,44)),age) #design matrix for fixed effects
z  = cbind(1,age) #design matrix for random effects
groups = Subject

## Not run: 
##D 
##D #a quick median regression
##D model = QRLMM(y,x,z,groups,MaxIter=200)
##D 
##D beta = save$res$beta  #fixed effects
##D weights = save$res$weight  #random weights
##D nj = c(as.data.frame(table(groups))[,2]) #obs per subject
##D fixed = x##D 
##D random = rep(0,dim(x)[1])  #initializing random shift
##D 
##D for (j in 1:length(nj))
##D { 
##D   z1=matrix(z[(sum(nj[1:j-1])+1):(sum(nj[1:j])),],ncol=dim(z)[2])
##D   random[(sum(nj[1:j-1])+1):(sum(nj[1:j]))] = z1##D 
##D }
##D 
##D pred = fixed + random  #predictions
##D group.plot(age,pred,groups,type = "l")
##D group.points(age,distance,groups)
##D 
##D ##########
##D #Fit a very quick regression for the three quartiles (Just for having an idea!)
##D 
##D QRLMM(y,x,z,groups,p = c(0.25,0.50,0.75),MaxIter=50,M=10)
##D 
##D #A full profile quantile regression (This might take some time)
##D QRLMM(y,x,z,groups,p = seq(0.05,0.95,0.05),MaxIter=300,M=10)
##D 
##D #A simple output example
##D -------------------------------------------------
##D Quantile Regression for Linear Mixed Model
##D -------------------------------------------------
##D Quantile = 0.75
##D Subjects = 27 ; Observations = 108 ; Balanced = 4
##D -----------
##D Estimates
##D -----------
##D - Fixed effects
##D Estimate Std. Error z value Pr(>|z|)
##D beta 1 17.08405 0.53524 31.91831 0
##D 19
##D beta 2 2.15393 0.36929 5.83265 0
##D beta 3 0.61882 0.05807 10.65643 0
##D sigma = 0.38439
##D Random effects
##D 
##D i)  weights
##D    ...
##D    
##D ii) Varcov matrix
##D z1 z2
##D z1 0.16106 -0.00887
##D z2 -0.00887 0.02839
##D ------------------------
##D Model selection criteria
##D ------------------------
##D Loglik AIC BIC HQ
##D Value -216.454 446.907 465.682 454.52
##D -------
##D Details
##D -------
##D Convergence reached? = FALSE
##D Iterations = 300 / 300
##D Criteria = 0.00381
##D MC sample = 10
##D Cut point = 0.25
##D Processing time = 7.590584 mins
## End(Not run)



