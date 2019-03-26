library(asremlPlus)


### Name: as.alldiffs
### Title: Forms an 'alldiffs.object' from the supplied predictions, along
###   with those statistics, associated with the predictions and their
###   pairwise differences, that have been supplied.
### Aliases: as.alldiffs
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
##D   Var.preds <- Var.pred$pvals
##D   Var.sed <- Var.pred$sed
##D   Var.vcov <- NULL
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
    den.df <- min(Var.preds$df)
    ## Modify Var.preds to be compatible with a predictions.frame
    Var.preds <- as.predictions.frame(Var.preds, predictions = "emmean", 
                                      se = "SE", interval.type = "CI", 
                                      interval.names = c("lower.CL", "upper.CL"))
    Var.vcov <- vcov(Var.emm)
    Var.sed <- NULL
  }

  ## Use the predictions obtained with either asreml or lmerTest
  if (exists("Var.preds"))
  {
    ## Form an all.diffs object
     Var.diffs <- as.alldiffs(predictions = Var.preds, classify = "Nitrogen:Variety", 
                              sed = Var.sed, vcov = Var.vcov, tdf = den.df)

    ## Check the class and validity of the alldiffs object
    is.alldiffs(Var.diffs)
    validAlldiffs(Var.diffs)
  }



