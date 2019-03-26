library(psych)


### Name: omega
### Title: Calculate McDonald's omega estimates of general and total factor
###   saturation
### Aliases: omega omegaSem omegaFromSem omegah omegaDirect directSl
### Keywords: multivariate models

### ** Examples

## Not run: 
##D  test.data <- Harman74.cor$cov
##D # if(!require(GPArotation)) {message("Omega requires GPA rotation" )} else {
##D       my.omega <- omega(test.data)       
##D       print(my.omega,digits=2)
##D #}
##D  
##D #create 9 variables with a hierarchical structure
##D v9 <- sim.hierarchical()
##D #with correlations of
##D round(v9,2)
##D #find omega 
##D v9.omega <- omega(v9,digits=2)
##D v9.omega
##D 
##D #create 8 items with a two factor solution, showing the use of the flip option
##D sim2 <- item.sim(8)
##D omega(sim2)   #an example of misidentification-- remember to look at the loadings matrices.
##D omega(sim2,2)  #this shows that in fact there is no general factor
##D omega(sim2,2,option="first") #but, if we define one of the two group factors 
##D      #as a general factor, we get a falsely high omega 
##D #apply omega to analyze 6 mental ability tests 
##D data(ability.cov)   #has a covariance matrix
##D omega(ability.cov$cov)
##D 
##D #om <- omega(Thurstone)
##D #round(om$omega.group,2)
##D #round(om$omega.group[2]/om$omega.group[1],2)  #fraction of reliable that is general variance
##D # round(om$omega.group[3]/om$omega.group[1],2)  #fraction of reliable that is group variance
##D 
##D #To find factor score estimates for the hierarchical model it is necessary to 
##D #do two extra steps.
##D 
##D #Consider the case of the raw data in an object data.  (An example from simulation)
##D # set.seed(42)
##D # gload <- matrix(c(.9,.8,.7),nrow=3)
##D # fload <- matrix(c(.8,.7,.6,rep(0,9),.7,.6,.5,rep(0,9),.7,.6,.4),   ncol=3)
##D # data <- sim.hierarchical(gload=gload,fload=fload, n=100000, raw=TRUE)
##D # 
##D # f3 <- fa(data$observed,3,scores="tenBerge", oblique.scores=TRUE)
##D # f1 <- fa(f3$scores)
##D 
##D # om <- omega(data$observed,sl=FALSE) #draw the hierarchical figure
##D # The scores from om are based upon the Schmid-Leiman factors and although the g factor 
##D # is identical, the group factors are not.
##D # This is seen in the following correlation matrix
##D # hier.scores <- cbind(om$scores,f1$scores,f3$scores)
##D # lowerCor(hier.scores)
##D #
##D #jensen <- sim.hierarchical()   #create a hierarchical structure
##D #om.jen <- omegaSem(jensen,lavaan=TRUE)  #do the exploratory omega with confirmatory as well
##D #lav.mod <- om.jen$omegaSem$model$lavaan #get the lavaan code or create it yourself
##D # lav.mod <- 'g =~ +V1+V2+V3+V4+V5+V6+V7+V8+V9
##D #              F1=~  + V1 + V2 + V3             
##D #              F2=~  + V4 + V5 + V6 
##D #              F3=~  + V7 + V8 + V9 '  
##D #lav.jen <- cfa(lav.mod,sample.cov=jensen,sample.nobs=500,orthogonal=TRUE,std.lv=TRUE)
##D # omegaFromSem(lav.jen,jensen)
##D #the directSl solution
##D #direct.jen <- directSl(jen)
##D #direct.jen 
##D 
##D #try a one factor solution -- this is not recommended, but sometimes done
##D #it will just give omega_total
##D # lav.mod.1 <- 'g =~ +V1+V2+V3+V4+V5+V6+V7+V8+V9 '  
##D #lav.jen.1<- cfa(lav.mod.1,sample.cov=jensen,sample.nobs=500,orthogonal=TRUE,std.lv=TRUE)
##D # omegaFromSem(lav.jen.1,jensen)
##D 
##D 
##D 
## End(Not run)



