library(CPMCGLM)


### Name: print.CPMCGLM
### Title: Output of a 'CPMCGLM' object
### Aliases: print.CPMCGLM
### Keywords: print

### ** Examples

# load data
## Not run: 
##D data(data_sim)
##D 
##D #Linear Gaussian Model
##D fit1 <- CPMCGLM(formula= Weight~Age+as.factor(Sport)+Desease+Height,
##D family="gaussian",link="identity",data=data_sim,varcod="Age",N=1000,
##D boxcox=c(0,1,2,3))
##D ### print fit1
##D fit1
## End(Not run)



