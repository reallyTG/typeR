library(OUwie)


### Name: OUwie.boot
### Title: Parametric bootstrap function
### Aliases: OUwie.boot
### Keywords: models

### ** Examples

data(tworegime)

##First step is estimate parameters under a particular model:
#pp <- OUwie(tree,trait,model=c("OUMV"),root.station=TRUE)

##Second step is to run bootstrap replicates:
#boot.reps <- OUwie.boot(tree,trait,model="OUMV", nboot=10, alpha=pp$solution[1,], 
#sigma.sq=pp$solution[2,],theta=pp$theta[,1], theta0=pp$theta[1,1])

##Finally summarize to obtain the desired confidence -- here is the 95% CI:
#apply(boot.reps, 2, quantile, probs=c(0.025,0.975))




