library(multilevelPSA)


### Name: loess.plot
### Title: Loess plot with density distributions for propensity scores and
###   outcomes on top and right, respectively.
### Aliases: loess.plot

### ** Examples

## Not run: 
##D require(multilevelPSA)
##D require(party)
##D data(pisana)
##D data(pisa.psa.cols)
##D cnt = 'USA' #Can change this to USA, MEX, or CAN
##D pisana2 = pisana[pisana$CNT == cnt,]
##D pisana2$treat <- as.integer(pisana2$PUBPRIV) %% 2
##D lr.results <- glm(treat ~ ., data=pisana2[,c('treat',pisa.psa.cols)], family='binomial')
##D st = data.frame(ps=fitted(lr.results), 
##D 				math=apply(pisana2[,paste('PV', 1:5, 'MATH', sep='')], 1, mean), 
##D 				pubpriv=pisana2$treat)
##D 				st$treat = as.logical(st$pubpriv)
##D loess.plot(st$ps, response=st$math, treatment=st$treat, percentPoints.control = 0.4, 
##D            percentPoints.treat=0.4)
## End(Not run)



