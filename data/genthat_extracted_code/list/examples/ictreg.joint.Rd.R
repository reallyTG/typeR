library(list)


### Name: ictreg.joint
### Title: Item Count Technique: Outcome Models
### Aliases: ictreg.joint

### ** Examples


## Not run: 
##D data(mexico)
##D loyal <- mexico[mexico$mex.loyal == 1,]
##D notloyal <- mexico[mexico$mex.loyal == 0,]
##D 
##D ## Logistic outcome regression
##D ## (effect of vote-selling on turnout)
##D ## This replicates Table 4 in Imai et al. 2014
##D 
##D loyalreg <- ictreg.joint(formula = mex.y.all ~ mex.male + mex.age + mex.age2 + mex.education +  
##D                          mex.interest + mex.married +
##D                          mex.wealth + mex.urban + mex.havepropoganda + mex.concurrent, data = loyal,
##D                          treat = "mex.t", outcome = "mex.votecard", J = 3, constrained = TRUE,
##D                          outcome.reg = "logistic", maxIter = 1000)
##D summary(loyalreg)
##D 
##D ## Linear outcome regression
##D ## (effect of vote-selling on candidate approval)
##D ## This replicates Table 5 in Imai et al. 2014
##D 
##D approvalreg <- ictreg.joint(formula = mex.y.all ~ mex.male + mex.age + mex.age2 +
##D                             mex.education +
##D                             mex.interest + mex.married +
##D                             mex.urban + 
##D                             mex.cleanelections + mex.cleanelectionsmiss +
##D                             mex.havepropoganda +
##D                             mex.wealth + mex.northregion +
##D                             mex.centralregion + mex.metro + mex.pidpriw2 + 
##D 			    mex.pidpanw2 + mex.pidprdw2,
##D                             data = mexico, treat = "mex.t", outcome = "mex.epnapprove",
##D                             J = 3, constrained = TRUE,
##D                             outcome.reg = "linear", maxIter = 1000)
##D 
##D 
##D summary(approvalreg)
## End(Not run)




