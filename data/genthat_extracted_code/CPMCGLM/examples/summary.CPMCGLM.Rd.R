library(CPMCGLM)


### Name: summary.CPMCGLM
### Title: Short summary of a 'CPMCGLM' object
### Aliases: summary.CPMCGLM
### Keywords: summary

### ** Examples

## Not run: 
##D # load data
##D data(data_sim)
##D 
##D #Linear Gaussian Model
##D fit1 <- CPMCGLM(formula= Weight~Age+as.factor(Sport)+Desease+Height,
##D family="gaussian",link="identity",data=data_sim,varcod="Age",N=1000,
##D boxcox=c(0,1,2,3))
##D ### summary fit1
##D summary(fit1)
## End(Not run)



