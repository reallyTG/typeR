library(pamm)


### Name: EAMM
### Title: Simulation function for exploratory power analysis for random
###   effects
### Aliases: EAMM
### Keywords: misc

### ** Examples

## Not run: 
##D   ours <- EAMM(numsim=10,group=10,repl=4,fixed=c(0,1,1),VI=seq(0.1,0.3,0.05),
##D              VS=seq(0.05,0.2,0.05) )
##D   plot(ours, "both")
##D   
##D   (fm1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy))
##D   ours2 <- EAMM(numsim=10, mer.model=list(model=fm1,env="Days",random="Subject"),
##D       VI=seq(0.3,0.5,0.1), VS=seq(0.05,0.2,0.05) )
##D   plot(ours2, "both")
##D    
## End(Not run)



