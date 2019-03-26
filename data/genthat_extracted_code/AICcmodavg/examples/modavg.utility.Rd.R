library(AICcmodavg)


### Name: modavg.utility
### Title: Various Utility Functions
### Aliases: reverse.parm reverse.exclude formatCands
### Keywords: models

### ** Examples

##a main effect
reverse.parm(parm = "Ageyoung") #does not return anything


##an interaction term as it might appear in the output
reverse.parm(parm = "Ageyoung:time") #returns the reverse


##exclude two interaction terms
reverse.exclude(exclude = list("Age*time", "A:B"))
##returns all combinations
reverse.exclude(exclude = list("Age:time", "A*B"))
##returns all combinations


##Mazerolle (2006) frog water loss example
data(dry.frog)

##setup a subset of models of Table 1
Cand.models <- list( )
Cand.models[[1]] <- lm(log_Mass_lost ~ Shade + Substrate +
                       cent_Initial_mass + Initial_mass2,
                       data = dry.frog)
Cand.models[[2]] <- lm(log_Mass_lost ~ Shade + Substrate +
                       cent_Initial_mass + Initial_mass2 +
                       Shade:Substrate, data = dry.frog)
Cand.models[[3]] <- lm(log_Mass_lost ~ cent_Initial_mass +
                       Initial_mass2, data = dry.frog)

formatCands(Cand.models)



