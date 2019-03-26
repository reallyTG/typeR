library(AICcmodavg)


### Name: AICcmodavg-package
### Title: Model Selection and Multimodel Inference Based on (Q)AIC(c)
### Aliases: AICcmodavg-package AICcmodavg
### Keywords: models

### ** Examples

##anuran larvae example from Mazerolle (2006) - Poisson GLM with offset
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
c_hat(Cand.mod[[1]], method = "pearson") #uses Pearson's chi-square/df
##note the very low overdispersion: in this case, the analysis could be
##conducted without correcting for c-hat as its value is reasonably close
##to 1  

##assign names to each model
Modnames <- c("type + logperim + invertpred", "type + logperim",
              "type + invertpred", "type", "logperim + invertpred",
              "logperim", "invertpred", "intercept only") 

##model selection table based on AICc
aictab(cand.set = Cand.mod, modnames = Modnames)

##compute evidence ratio
evidence(aictab(cand.set = Cand.mod, modnames = Modnames))

##compute confidence set based on 'raw' method
confset(cand.set = Cand.mod, modnames = Modnames, second.ord = TRUE,
        method = "raw")  

##compute importance value for "TypeBOG" - same number of models
##with vs without variable
importance(cand.set = Cand.mod, modnames = Modnames, parm = "TypeBOG") 

##compute model-averaged estimate of "TypeBOG"
modavg(cand.set = Cand.mod, modnames = Modnames, parm = "TypeBOG")

##compute model-averaged estimate of "TypeBOG" with shrinkage
##same number of models with vs without variable
modavgShrink(cand.set = Cand.mod, modnames = Modnames,
             parm = "TypeBOG")

##compute model-average predictions for two types of ponds
##create a data set for predictions
dat.pred <- data.frame(Type = factor(c("BOG", "UPLAND")),
                       log.Perimeter = mean(min.trap$log.Perimeter),
                       Num_ranatra = mean(min.trap$Num_ranatra),
                       Effort = mean(min.trap$Effort))

##model-averaged predictions across entire model set
modavgPred(cand.set = Cand.mod, modnames = Modnames,
           newdata = dat.pred, type = "response")

##compute model-averaged effect size between two groups
##works when data set has two rows
modavgEffect(cand.set = Cand.mod, modnames = Modnames,
             newdata = dat.pred, type = "link")


##single-season occupancy model example modified from ?occu
## Not run: 
##D require(unmarked)
##D ##single season
##D data(frogs)
##D pferUMF <- unmarkedFrameOccu(pfer.bin)
##D ## add some fake covariates for illustration
##D siteCovs(pferUMF) <- data.frame(sitevar1 = rnorm(numSites(pferUMF)),
##D                                 sitevar2 = rnorm(numSites(pferUMF))) 
##D      
##D ## observation covariates are in site-major, observation-minor order
##D obsCovs(pferUMF) <- data.frame(obsvar1 = rnorm(numSites(pferUMF) *
##D                                  obsNum(pferUMF))) 
##D 
##D ##check detection history data from data object
##D detHist(pferUMF)
##D 
##D ##set up candidate model set
##D fm1 <- occu(~ obsvar1 ~ sitevar1, pferUMF)
##D ##check detection history data from model object
##D detHist(fm1)
##D 
##D fm2 <- occu(~ 1 ~ sitevar1, pferUMF)
##D fm3 <- occu(~ obsvar1 ~ sitevar2, pferUMF)
##D fm4 <- occu(~ 1 ~ sitevar2, pferUMF)
##D Cand.models <- list(fm1, fm2, fm3, fm4)
##D Modnames <- c("fm1", "fm2", "fm3", "fm4")
##D 
##D ##compute table
##D print(aictab(cand.set = Cand.models, modnames = Modnames,
##D        second.ord = TRUE), digits = 4)
##D 
##D ##compute evidence ratio
##D evidence(aictab(cand.set = Cand.models, modnames = Modnames))
##D ##evidence ratio between top model vs lowest-ranked model
##D evidence(aictab(cand.set = Cand.models, modnames = Modnames), model.high = "fm2", model.low = "fm3")
##D 
##D ##compute confidence set based on 'raw' method
##D confset(cand.set = Cand.models, modnames = Modnames, second.ord = TRUE,
##D         method = "raw")  
##D 
##D ##compute importance value for "sitevar1" on occupancy
##D ##same number of models with vs without variable
##D importance(cand.set = Cand.models, modnames = Modnames, parm = "sitevar1",
##D            parm.type = "psi") 
##D 
##D ##compute model-averaged estimate of "sitevar1" on occupancy
##D modavg(cand.set = Cand.models, modnames = Modnames, parm = "sitevar1",
##D        parm.type = "psi")
##D 
##D ##compute model-averaged estimate of "sitevar1" with shrinkage
##D ##same number of models with vs without variable
##D modavgShrink(cand.set = Cand.models, modnames = Modnames,
##D              parm = "sitevar1", parm.type = "psi")
##D 
##D ##compute model-average predictions for two types of ponds
##D ##create a data set for predictions
##D dat.pred <- data.frame(sitevar1 = seq(from = min(siteCovs(pferUMF)$sitevar1),
##D                          to = max(siteCovs(pferUMF)$sitevar1), by = 0.5),
##D                        sitevar2 = mean(siteCovs(pferUMF)$sitevar2))
##D 
##D ##model-averaged predictions of psi across range of values
##D ##of sitevar1 and entire model set
##D modavgPred(cand.set = Cand.models, modnames = Modnames,
##D            newdata = dat.pred, parm.type = "psi")
##D detach(package:unmarked)
## End(Not run)



