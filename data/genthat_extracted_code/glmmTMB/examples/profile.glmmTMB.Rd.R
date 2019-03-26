library(glmmTMB)


### Name: profile.glmmTMB
### Title: Compute likelihood profiles for a fitted model
### Aliases: profile.glmmTMB confint.profile.glmmTMB

### ** Examples

## Not run: 
##D m1 <- glmmTMB(count~ mined + (1|site), 
##D        zi=~mined, family=poisson, data=Salamanders)
##D salamander_prof1 <- profile(m1, parallel="multicore",
##D                             ncpus=2, trace=1)
##D ## testing
##D salamander_prof1 <- profile(m1, trace=1,parm=1)
##D salamander_prof1M <- profile(m1, trace=1,parm=1, npts = 4)
##D salamander_prof2 <- profile(m1, parm="theta_")
##D 
## End(Not run)
salamander_prof1 <- readRDS(system.file("example_files","salamander_prof1.rds",package="glmmTMB"))
if (require("ggplot2")) {
    ggplot(salamander_prof1,aes(.focal,sqrt(value))) +
        geom_point() + geom_line()+
        facet_wrap(~.par,scale="free_x")+
    geom_hline(yintercept=1.96,linetype=2)
}
salamander_prof1 <- readRDS(system.file("example_files","salamander_prof1.rds",package="glmmTMB"))
confint(salamander_prof1)
confint(salamander_prof1,level=0.99)



