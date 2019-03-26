library(AICcmodavg)


### Name: confset
### Title: Computing Confidence Set for the Kullback-Leibler Best Model
### Aliases: confset print.confset
### Keywords: models

### ** Examples

##anuran larvae example from Mazerolle (2006)
data(min.trap)
##assign "UPLAND" as the reference level as in Mazerolle (2006)          
min.trap$Type <- relevel(min.trap$Type, ref = "UPLAND") 

##set up candidate models          
Cand.mod <- list()
##global model          
Cand.mod[[1]] <- glm(Num_anura ~ Type + log.Perimeter + Num_ranatra,
                     family = poisson, offset = log(Effort),
                     data = min.trap) 
Cand.mod[[2]] <- glm(Num_anura ~ Type + log.Perimeter, family = poisson,
                     offset = log(Effort), data = min.trap) 
Cand.mod[[3]] <- glm(Num_anura ~ Type + Num_ranatra, family = poisson,
                     offset = log(Effort), data = min.trap) 
Cand.mod[[4]] <- glm(Num_anura ~ Type, family = poisson,
                     offset = log(Effort), data = min.trap) 
Cand.mod[[5]] <- glm(Num_anura ~ log.Perimeter + Num_ranatra,
                     family = poisson, offset = log(Effort),
                     data = min.trap) 
Cand.mod[[6]] <- glm(Num_anura ~ log.Perimeter, family = poisson,
                     offset = log(Effort), data = min.trap) 
Cand.mod[[7]] <- glm(Num_anura ~ Num_ranatra, family = poisson,
                     offset = log(Effort), data = min.trap) 
Cand.mod[[8]] <- glm(Num_anura ~ 1, family = poisson,
                     offset = log(Effort), data = min.trap) 
          
##check c-hat for global model
c_hat(Cand.mod[[1]]) #uses Pearson's chi-square/df
##note the very low overdispersion: in this case, the analysis could be
##conducted without correcting for c-hat as its value is reasonably close
##to 1  

##assign names to each model
Modnames <- c("type + logperim + invertpred", "type + logperim",
              "type + invertpred", "type", "logperim + invertpred",
              "logperim", "invertpred", "intercept only") 

##compute confidence set based on 'raw' method
confset(cand.set = Cand.mod, modnames = Modnames, second.ord = TRUE,
        method = "raw")  


##example with linear mixed model
## Not run: 
##D require(nlme)
##D 
##D ##set up candidate model list for Orthodont data set shown in Pinheiro
##D ##and Bates (2000:  Mixed-effect models in S and S-PLUS. Springer Verlag:
##D ##New York.)
##D Cand.models <- list()
##D Cand.models[[1]] <- lme(distance ~ age, random = ~age | Subject,
##D                         data = Orthodont, method = "ML")
##D Cand.models[[2]] <- lme(distance ~ age + Sex, data = Orthodont,
##D                         random = ~ 1 | Subject, method = "ML")
##D Cand.models[[3]] <- lme(distance ~ 1, data = Orthodont,
##D                         random = ~ 1 | Subject, method = "ML")
##D 
##D ##create a vector of model names
##D Modnames <- paste("mod", 1:length(Cand.models), sep = "")
##D 
##D ##compute confidence set based on 'raw' method
##D confset(cand.set = Cand.models, modnames = Modnames, second.ord = TRUE,
##D         method = "raw")
##D ##round to 4 digits after decimal point
##D print(confset(cand.set = Cand.models, modnames = Modnames,
##D               second.ord = TRUE, method = "raw"), digits = 4)
##D 
##D confset(cand.set = Cand.models, modnames = Modnames, second.ord = TRUE,
##D         level = 0.9, method = "raw")
##D 
##D ##compute confidence set based on 'ordinal' method
##D confset(cand.set = Cand.models, modnames = Modnames, second.ord = TRUE,
##D         method = "ordinal")
##D 
##D ##compute confidence set based on 'ratio' method
##D confset(cand.set = Cand.models, modnames = Modnames, second.ord = TRUE,
##D         method = "ratio", delta = 4)
##D 
##D confset(cand.set = Cand.models, modnames = Modnames, second.ord = TRUE,
##D         method = "ratio", delta = 8)
##D detach(package:nlme)
## End(Not run)



