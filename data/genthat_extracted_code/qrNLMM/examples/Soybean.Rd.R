library(qrNLMM)


### Name: Soybean
### Title: Growth of soybean plants
### Aliases: Soybean
### Keywords: datasets

### ** Examples

## Not run: 
##D data(Soybean)
##D attach(Soybean)
##D 
##D #################################
##D #A full model (no covariate)
##D 
##D y     = weight          #response
##D x     = Time            #time
##D 
##D #Expression for the three parameter logistic curve
##D 
##D exprNL = expression((fixed[1]+random[1])/(1 + exp(((fixed[2]+random[2])- x)/(fixed[3]+random[3]))))
##D 
##D #Initial values for fixed effects
##D initial = c(max(y),0.6*max(y),0.73*max(y))
##D 
##D #A median regression (by default)
##D median_reg = QRNLMM(y,x,Plot,initial,exprNL)
##D 
##D #Assing the fit
##D 
##D fxd     = median_reg$res$beta
##D nlmodel = median_reg$res$nlmodel
##D seqc    = seq(min(x),max(x),length.out = 500)
##D 
##D group.plot(x = Time,y = weight,groups = Plot,type="l",
##D              main="Soybean profiles",xlab="time (days)",
##D              ylab="mean leaf weight (gr)",col="gray")
##D              
##D lines(seqc,nlmodel(x = seqc,fixed = fxd,random = rep(0,3)),
##D       lwd=2,col="blue")             
##D 
##D #########################################
##D #A model for compairing the two genotypes
##D 
##D y     = weight          #response
##D x     = Time            #time
##D covar = c(Variety)-1    #factor genotype (0=Forrest, 1=Plan Introduction)
##D 
##D #Expression for the three parameter logistic curve with a covariate
##D 
##D exprNL = expression((fixed[1]+(fixed[4]*covar[1])+random[1])/
##D                     (1 + exp(((fixed[2]+random[2])- x)/(fixed[3]+random[3]))))
##D 
##D #Initial values for fixed effects
##D initial = c(max(y),0.6*max(y),0.73*max(y),3)
##D 
##D # A quantile regression for the three quartiles
##D box_reg = QRNLMM(y,x,Plot,initial,exprNL,covar,p=c(0.25,0.50,0.75))
##D 
##D #Assing the fit for the median (second quartile)
##D 
##D fxd     = box_reg[[2]]$res$beta
##D nlmodel = box_reg[[2]]$res$nlmodel
##D seqc    = seq(min(x),max(x),length.out = 500)
##D 
##D group.plot(x = Time[Variety=="P"],y = weight[Variety=="P"],
##D              groups = Plot[Variety=="P"],type="l",col="light blue",
##D              main="Soybean profiles by genotype",xlab="time (days)",
##D              ylab="mean leaf weight (gr)")
##D              
##D group.lines(x = Time[Variety=="F"],y = weight[Variety=="F"],
##D               groups = Plot[Variety=="F"],col="gray")
##D              
##D lines(seqc,nlmodel(x = seqc,fixed = fxd,random = rep(0,3),covar=1),
##D       lwd=2,col="blue")
##D 
##D lines(seqc,nlmodel(x = seqc,fixed = fxd,random = rep(0,3),covar=0),
##D       lwd=2,col="black")
##D 
## End(Not run)



