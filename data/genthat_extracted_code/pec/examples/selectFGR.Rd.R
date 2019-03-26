library(pec)


### Name: selectFGR
### Title: Stepwise variable selection in the Fine & Gray regression
###   competing risk model
### Aliases: selectFGR
### Keywords: survival

### ** Examples

## Not run: 
##D library(riskRegression)
##D library(prodlim)
##D library(lava)
##D library(cmprsk)
##D library(pec)
##D m <- crModel()
##D m <- addvar(m,c('X1','X2','X3','X4','X5','X6','X7','X8','X9','X10'))
##D distribution(m,c("X2","X7","X9")) <- binomial.lvm()
##D regression(m,eventtime1~X1+X2+X5+X9) <- c(-1,1,0.5,0.8)
##D set.seed(100)
##D d <- sim(m,100)
##D ## full formula
##D ff <- Hist(time, event) ~ X1 + X2 + X3 + X4 +X5 + X6 + X7+ X8 + X9 + X10
##D 
##D # Fit full model with FGR
##D fg <- FGR(ff,cause=1,data=d)
##D 
##D # Backward selection based on the AIC
##D sfgAIC <- selectFGR(ff, data=d, rule="AIC", direction="backward") 
##D 
##D sfgAIC$fit # Final FGR-model with selected variables
##D 
##D # Risk reclassification plot at time = 4
##D plot(predictEventProb(fg,times=4,newdata=d),
##D      predictEventProb(sfgAIC,times=4,newdata=d))
##D 
##D # Backward selection based on the BIC, while forcing 
##D # the last two variables (X9 and X10) in the model
##D sfgBIC <- selectFGR(ff, data=d, rule="BIC", direction="backward", 
##D                   scope.min=~X9+X10)
##D 
##D ## apparent performance
##D pec(list(full.model=fg,selectedAIC=sfgAIC,selectedBIC=sfgBIC),
##D     formula=Hist(time, event)~1,
##D     data=d)
##D 
##D 
##D ## bootstrap cross-validation performance
##D set.seed(7)
##D pec(list(full.model=fg,selectedAIC=sfgAIC,selectedBIC=sfgBIC),
##D     formula=Hist(time, event)~1,
##D     data=d,
##D     B=5,
##D     splitMethod="bootcv")
## End(Not run)





