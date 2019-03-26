library(asremlPlus)


### Name: predictions.frame
### Title: Description of a predictions object
### Aliases: predictions.frame predictions.frame-class
### Keywords: asreml htest

### ** Examples

  data(Oats.dat)
  
  ## Use asreml to get predictions and associated statistics

  ## Not run: 
##D   m1.asr <- asreml(Yield ~ Nitrogen*Variety, 
##D                    random=~Blocks/Wplots,
##D                    data=Oats.dat)
##D   current.asrt <- asrtests(m1.asr)
##D   Var.pred <- asreml::predict.asreml(m1.asr, classify="Nitrogen:Variety", 
##D                                       sed=TRUE)
##D   if (getASRemlVersionLoaded(nchar = 1) == "3")
##D     Var.pred <- Var.pred$predictions
##D   Var.preds <- as.predictions.frame(Var.pred$pvals, se = "std.error", 
##D                                     est.status = "status")
##D   
## End(Not run)
  
  ## Use lmerTest and emmmeans to get predictions and associated statistics
  if (requireNamespace("lmerTest", quietly = TRUE) & 
      requireNamespace("emmeans", quietly = TRUE))
  {
    m1.lmer <- lmerTest::lmer(Yield ~ Nitrogen*Variety + (1|Blocks/Wplots),
                              data=Oats.dat)
    Var.emm <- emmeans::emmeans(m1.lmer, specs = ~ Nitrogen:Variety)
    Var.preds <- summary(Var.emm)
    Var.preds <- as.predictions.frame(Var.preds, predictions = "emmean", 
                                      se = "SE", interval.type = "CI", 
                                      interval.names = c("lower.CL", "upper.CL"))
  }

  if (exists("Var.preds"))
  {
    ## Check the class and validity of the alldiffs object
    is.predictions.frame(Var.preds)
    validPredictionsFrame(Var.preds)
  }



