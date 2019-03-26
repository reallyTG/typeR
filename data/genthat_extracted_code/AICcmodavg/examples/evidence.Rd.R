library(AICcmodavg)


### Name: evidence
### Title: Compute Evidence Ratio Between Two Models
### Aliases: evidence print.evidence
### Keywords: models

### ** Examples

##run example from Burnham and Anderson (2002, p. 183) with two
##non-nested models
data(pine)
Cand.set <- list( )
Cand.set[[1]] <- lm(y ~ x, data = pine)
Cand.set[[2]] <- lm(y ~ z, data = pine)

##assign model names
Modnames <- c("raw density", "density corrected for resin content")

##compute model selection table
aicctable.out <- aictab(cand.set = Cand.set, modnames = Modnames)

##compute evidence ratio
evidence(aic.table = aicctable.out, model.low = "raw density")
evidence(aic.table = aicctable.out) #gives the same answer
##round to 4 digits after decimal point
print(evidence(aic.table = aicctable.out, model.low = "raw density"),
      digits = 4)


##example with bictab
## Not run: 
##D ##compute model selection table
##D bictable.out <- bictab(cand.set = Cand.set, modnames = Modnames)
##D ##compute evidence ratio
##D evidence(bictable.out, model.low = "raw density")
## End(Not run)


##run models for the Orthodont data set in nlme package
## Not run: 
##D require(nlme)
##D 
##D ##set up candidate model list
##D Cand.models <- list()
##D Cand.models[[1]] <- lme(distance ~ age, data = Orthodont, method = "ML")
##D ##random is ~ age | Subject
##D Cand.models[[2]] <- lme(distance ~ age + Sex, data = Orthodont,
##D                         random = ~ 1, method = "ML")
##D Cand.models[[3]] <- lme(distance ~ 1, data = Orthodont, random = ~ 1,
##D                         method = "ML")
##D 
##D ##create a vector of model names
##D Modnames <- paste("mod", 1:length(Cand.models), sep = " ")
##D 
##D ##compute AICc table
##D aic.table.1 <- aictab(cand.set = Cand.models, modnames = Modnames,
##D                       second.ord = TRUE)
##D 
##D ##compute evidence ratio between best model and second-ranked model
##D evidence(aic.table = aic.table.1)
##D 
##D ##compute the same value but from an unsorted model selection table
##D evidence(aic.table = aictab(cand.set = Cand.models,
##D            modnames = Modnames, second.ord = TRUE, sort = FALSE))
##D 
##D ##compute evidence ratio between second-best model and third-ranked
##D ##model  
##D evidence(aic.table = aic.table.1, model.high = "mod1",
##D          model.low = "mod3")
##D detach(package:nlme)
## End(Not run)





