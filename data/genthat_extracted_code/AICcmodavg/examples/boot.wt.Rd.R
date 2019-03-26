library(AICcmodavg)


### Name: boot.wt
### Title: Compute Model Selection Relative Frequencies
### Aliases: boot.wt boot.wt.default boot.wt.AICaov.lm boot.wt.AICbetareg
###   boot.wt.AICsclm.clm boot.wt.AICglm.lm boot.wt.AIChurdle boot.wt.AIClm
###   boot.wt.AICmultinom.nnet boot.wt.AICpolr boot.wt.AICrlm.lm
###   boot.wt.AICsurvreg boot.wt.AICvglm boot.wt.AICzeroinfl print.boot.wt
### Keywords: models

### ** Examples

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
Cand.models[[4]] <- lm(log_Mass_lost ~ Shade + cent_Initial_mass +
                       Initial_mass2, data = dry.frog)
Cand.models[[5]] <- lm(log_Mass_lost ~ Substrate + cent_Initial_mass +
                       Initial_mass2, data = dry.frog)

##create a vector of names to trace back models in set
Modnames <- paste("mod", 1:length(Cand.models), sep = " ")

##generate AICc table with bootstrapped relative
##frequencies of model selection
boot.wt(cand.set = Cand.models, modnames = Modnames, sort = TRUE,
        nsim = 10) #number of iterations should be much higher


##Burnham and Anderson (2002) flour beetle data
## Not run: 
##D data(beetle)
##D ##models as suggested by Burnham and Anderson p. 198          
##D Cand.set <- list( )
##D Cand.set[[1]] <- glm(Mortality_rate ~ Dose, family =
##D                      binomial(link = "logit"), weights = Number_tested,
##D                      data = beetle)
##D Cand.set[[2]] <- glm(Mortality_rate ~ Dose, family =
##D                      binomial(link = "probit"), weights = Number_tested,
##D                      data = beetle)
##D Cand.set[[3]] <- glm(Mortality_rate ~ Dose, family =
##D                      binomial(link ="cloglog"), weights = Number_tested,
##D                      data = beetle)
##D 
##D ##create a vector of names to trace back models in set
##D Modnames <- paste("Mod", 1:length(Cand.set), sep = " ")
##D 
##D ##model selection table with bootstrapped
##D ##relative frequencies
##D boot.wt(cand.set = Cand.set, modnames = Modnames)
## End(Not run)



