library(embryogrowth)


### Name: plot_transition
### Title: Show fonction used for transition
### Aliases: plot_transition

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(nest)
##D formated <- FormatNests(nest)
##D data(resultNest_4p_SSM4p)
##D # Get a set of parameters without transition
##D x1 <- resultNest_4p_SSM4p$par
##D # Generate a set of parameters with transition
##D x2 <- switch.transition(x1)
##D x2 <- x2[names(x2)!="transition_P"]
##D x2["transition_S"] <- 4
##D pfixed <- c(rK=2.093313, transition_P=20)
##D resultNest_4p_transition <- searchR(parameters=x2, fixed.parameters=pfixed, 
##D temperatures=formated, derivate=dydt.Gompertz, M0=1.7, 
##D test=c(Mean=39.33, SD=1.92))
##D data(resultNest_4p_transition)
##D # show the model for smallest size
##D plotR(resultNest_4p_transition, ylim=c(0,0.3))
##D # show the model for larger sizes
##D plotR(resultNest_4p_transition, set.par=2, ylim=c(0,0.3))
##D # plot model for both together
##D plotR(resultNest_4p_transition, set.par=c(1,2), ylim=c(0,0.3), 
##D        col=c("red", "black"), legend=list("Initial", "End"))
##D plot_transition(result=resultNest_4p_transition, las=1, sizes=c(0,40))
##D compare_AIC(one.model=list(resultNest_4p_SSM4p), two.models=list(resultNest_4p_transition))
##D # Note that the model with fitted transition_P is trivial. Embryos grow fast until  
##D # they reach hatchling size and then growth rate becomes null!
## End(Not run)



