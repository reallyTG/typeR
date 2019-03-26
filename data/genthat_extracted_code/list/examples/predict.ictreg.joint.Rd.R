library(list)


### Name: predict.ictreg.joint
### Title: Predict Method for Item Count Technique, Outcome Regressions
### Aliases: predict.ictreg.joint

### ** Examples



data(mexico)
loyal <- mexico[mexico$mex.loyal == 1,]
notloyal <- mexico[mexico$mex.loyal == 0,]

## Not run: 
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
##D 
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
##D 
##D ## Generate predicted probability of turnout, averaged over the whole sample,
##D ## for vote sellers (z = 1), non-vote sellers (z = 0), and the difference
##D ## between vote sellers and non-vote sellers, in the sample of party supporters.
##D ## This replicates the results in the righthand panel of Figure 2 in Imai et al. 2014
##D 
##D loyalpred <- predict.ictreg.joint(loyalreg, se.fit = TRUE, interval = "confidence", 
##D 					level = 0.95, avg = TRUE, 
##D 					sensitive.value = "both", 
##D 					sensitive.diff = TRUE, return.draws = TRUE,
##D     					predict.sensitive = TRUE)
##D 
##D loyalpred$fit
##D 
##D ## View predicted probability of vote selling, in the sample of party supporters.
##D ## This replicates the results in the lefthand panel of Figure 2 in Imai et al. 2014
##D 
##D loyalpred$fitsens
##D 
##D 
## End(Not run)




